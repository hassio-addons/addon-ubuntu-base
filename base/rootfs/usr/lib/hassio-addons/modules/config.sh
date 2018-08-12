#!/usr/bin/env bash
# ==============================================================================
# Community Hass.io Add-ons: Bash functions library
#
# Provides functions for reading the add-on configuration
# ==============================================================================

# ==============================================================================
# GLOBALS
# ==============================================================================
readonly ADDON_CONFIG_PATH=/data/options.json

# ==============================================================================
# FUNCTIONS
# ==============================================================================

# ------------------------------------------------------------------------------
# Fetches a configuration value from the add-on config file
#
# Arguments:
#   $1 Key of the config option
# Returns:
#   Value of the key in the configuration file
# ------------------------------------------------------------------------------
hass.config.get() {
    local key=${1}
    hass.log.trace "${FUNCNAME[0]}:" "$@"

    if ! hass.config.exists "${key}"; then
        return "${EX_OK}"
    fi

    if hass.config.is_secret "${key}"; then
        hass.config.get_secret "${key}"
        return "${EX_OK}"
    fi

    if hass.jq.is_string "${ADDON_CONFIG_PATH}" ".${key}"; then
        hass.jq "${ADDON_CONFIG_PATH}" ".${key} // empty"
        return "${EX_OK}"
    fi

    if hass.jq.is_boolean "${ADDON_CONFIG_PATH}" ".${key}"; then
        hass.jq "${ADDON_CONFIG_PATH}" ".${key} // false"
        return "${EX_OK}"
    fi

    if hass.jq.is_array "${ADDON_CONFIG_PATH}" ".${key}"; then
        if hass.jq.has_value "${ADDON_CONFIG_PATH}" ".${key}"; then
            hass.jq "${ADDON_CONFIG_PATH}" ".${key}[]"
        fi
        return "${EX_OK}"
    fi

    if hass.jq.is_object "${ADDON_CONFIG_PATH}" ".${key}"; then
        if hass.jq.has_value "${ADDON_CONFIG_PATH}" ".${key}"; then
            hass.jq "${ADDON_CONFIG_PATH}" ".${key}[]"
        fi
        return "${EX_OK}"
    fi

    if hass.jq.is_number "${ADDON_CONFIG_PATH}" ".${key}"; then
        hass.jq "${ADDON_CONFIG_PATH}" ".${key}"
        return "${EX_OK}"
    fi

    return "${EX_NOK}"
}

# ------------------------------------------------------------------------------
# Gets a configuration option value by getting it from secrets.yaml
#
# Arguments:
#   $1 Key of the config option
# Returns:
#   Value of the key in the referenced to the secrets file
# ------------------------------------------------------------------------------
hass.config.get_secret() {
    local key=${1}
    local secret
    local value

    hass.log.trace "${FUNCNAME[0]}:" "$@"

    if ! hass.directory_exists "/config"; then
        hass.log.error "This add-on does not support secrets!"
        return "${EX_NOK}"
    fi

    if ! hass.file_exists "/config/secrets.yaml"; then
        hass.log.error "A secret was requested, but could not find a secrets.yaml"
        return "${EX_NOK}"
    fi

    if ! hass.config.is_secret "${key}"; then
        hass.log.error "The requested secret does not reference the secrets.yaml"
        return "${EX_NOK}"
    fi

    secret=$(hass.jq "${ADDON_CONFIG_PATH}" ".${key} // empty")
    secret="${secret#'!secret '}"

    value=$(yq read "/config/secrets.yaml" "${secret}" )

    if [[ "${value}" = "null" ]]; then
        hass.log.error "Secret ${secret} not found in secrets.yaml file."
        return "${EX_NOK}"
    fi

    echo "${value}"
    return "${EX_OK}"
}

# ------------------------------------------------------------------------------
# Checks if a password is safe to use, using IHaveBeenPwned
#
# Arguments:
#   $1 Key of the config option
# Returns:
#   None
# ------------------------------------------------------------------------------
hass.config.is_safe_password() {
    local key=${1}
    local password

    hass.log.trace "${FUNCNAME[0]}:" "$@"

    # If the password is safe, we'll accept it anyways.
    password=$(hass.config.get "${key}")
    if hass.pwned.is_safe_password "${password}"; then
        return "${EX_OK}"
    fi

    # If the bypass is not configured, we'll fail.
    if ! hass.config.exists "i_like_to_be_pwned"; then
        return "${EX_NOK}"
    fi

    # If the bypass is enabled, we'll return OK.
    if hass.config.true "i_like_to_be_pwned"; then
        hass.log.warning "Have I Been Pwned bypass enabled."
        return "${EX_OK}"
    fi

    # If we reach this point, we'll just fail.
    return "${EX_NOK}"
}

# ------------------------------------------------------------------------------
# Checks if a configuration option exists in the config file
#
# Arguments:
#   $1 Key of the config option
# Returns:
#   None
# ------------------------------------------------------------------------------
hass.config.exists() {
    local key=${1}
    hass.log.trace "${FUNCNAME[0]}:" "$@"

    if ! hass.jq.exists "${ADDON_CONFIG_PATH}" ".${key}"; then
        return "${EX_NOK}"
    fi

    if hass.config.is_secret "${key}" \
        && ! hass.config.get_secret "${key}" > /dev/null;
    then
        return "${EX_NOK}"
    fi

    return "${EX_OK}"
}

# ------------------------------------------------------------------------------
# Checks if a configuration option has an actual value
#
# Arguments:
#   $1 Key of the config option
# Returns:
#   None
# ------------------------------------------------------------------------------
hass.config.has_value() {
    local key=${1}
    local value
    hass.log.trace "${FUNCNAME[0]}:" "$@"

    if ! hass.jq.has_value "${ADDON_CONFIG_PATH}" ".${key}"; then
        return "${EX_NOK}"
    fi

    if hass.config.is_secret "${key}"; then
        # Could not retrieve secret
        if ! value=$(hass.config.get_secret "${key}"); then
            return "${EX_NOK}"
        fi

        # Resolved secret does not contain a value
        if ! hass.has_value "${value}"; then
            return "${EX_NOK}"
        fi
    fi

    return "${EX_OK}"
}

# ------------------------------------------------------------------------------
# Checks if a configuration option is true
#
# Arguments:
#   $1 Key of the config option
# Returns:
#   None
# ------------------------------------------------------------------------------
hass.config.true() {
    local key=${1}
    hass.log.trace "${FUNCNAME[0]}:" "$@"

    if ! hass.jq.is_boolean "${ADDON_CONFIG_PATH}" ".${key}"; then
        return "${EX_NOK}"
    fi

    if [[ $(hass.config.get "${key}") = "true" ]]; then
        return "${EX_OK}"
    fi

    return "${EX_NOK}"
}

# ------------------------------------------------------------------------------
# Checks if a configuration option is false
#
# Arguments:
#   $1 Key of the config option
# Returns:
#   None
# ------------------------------------------------------------------------------
hass.config.false() {
    local key=${1}
    hass.log.trace "${FUNCNAME[0]}:" "$@"

    if ! hass.jq.is_boolean "${ADDON_CONFIG_PATH}" ".${key}"; then
        return "${EX_NOK}"
    fi

    if [[ $(hass.config.get "${key}") = "false" ]]; then
        return "${EX_OK}"
    fi

    return "${EX_NOK}"
}

# ------------------------------------------------------------------------------
# Checks if a configuration option is refering to a secret
#
# Arguments:
#   $1 Key of the config option
# Returns:
#   None
# ------------------------------------------------------------------------------
hass.config.is_secret() {
    local key=${1}
    hass.log.trace "${FUNCNAME[0]}:" "$@"

    if ! hass.jq.is_string "${ADDON_CONFIG_PATH}" ".${key}"; then
        return "${EX_NOK}"
    fi

    if [[
        "$(hass.jq "${ADDON_CONFIG_PATH}" ".${key} // empty")" != '!secret '*
    ]]; then
        return "${EX_NOK}"
    fi

    return "${EX_OK}"
}
