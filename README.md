# Community Hass.io Add-ons: Ubuntu Base Images

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

[![GitLab CI][gitlabci-shield]][gitlabci]
![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Discord][discord-shield]][discord]
[![Community Forum][forum-shield]][forum]

Docker Ubuntu base images used by Community Hass.io Add-ons.

## About

These are the base images used by add-ons created by the Community Hass.io
Add-ons.

While Home Assistant provides base images, the images provided by this
repository contain some extras:

- Based on Ubuntu Stretch (slim)
- Adds [s6] as a process supervisor.
- Adds `jq` & `curl`, since every add-on uses them.
- Adds Docker [Label Schema][label-schema] support.
- Adds a large Bash function library for use with an add-on.
- Handles logs, add-on startup banners and update notifications.
- Several small adjustments and improvements.

## Docker status

[![Docker Architecture][armhf-arch-shield]][armhf-dockerhub]
[![Docker Version][armhf-version-shield]][armhf-microbadger]
[![Docker Layers][armhf-layers-shield]][armhf-microbadger]
[![Docker Pulls][armhf-pulls-shield]][armhf-dockerhub]

[![Docker Architecture][aarch64-arch-shield]][aarch64-dockerhub]
[![Docker Version][aarch64-version-shield]][aarch64-microbadger]
[![Docker Layers][aarch64-layers-shield]][aarch64-microbadger]
[![Docker Pulls][aarch64-pulls-shield]][aarch64-dockerhub]

[![Docker Architecture][amd64-arch-shield]][amd64-dockerhub]
[![Docker Version][amd64-version-shield]][amd64-microbadger]
[![Docker Layers][amd64-layers-shield]][amd64-microbadger]
[![Docker Pulls][amd64-pulls-shield]][amd64-dockerhub]

[![Docker Architecture][i386-arch-shield]][i386-dockerhub]
[![Docker Version][i386-version-shield]][i386-microbadger]
[![Docker Layers][i386-layers-shield]][i386-microbadger]
[![Docker Pulls][i386-pulls-shield]][i386-dockerhub]

## Changelog & Releases

This repository keeps a [change log](CHANGELOG.md). The format of the log
is based on [Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The Home Assistant [Community Forum][forum].
- The Home Assistant [Discord Chat Server][discord] for general Home Assistant
  discussions and questions.
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

We've set up a separate document for our
[contribution guidelines](CONTRIBUTING.md).

Thank you for being involved! :heart_eyes:

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## We have got some Hass.io add-ons for you

Want some more functionality to your Hass.io Home Assistant instance?

We have created multiple add-ons for Hass.io. For a full list, check out
our [GitHub Repository][repository].

## License

MIT License

Copyright (c) 2018 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[aarch64-anchore-shield]: https://anchore.io/service/badges/image/e0ed0cc51f6faa358b98f4adc1011d29584e9d2e4f1ed2765735cae1c1adf850
[aarch64-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fubuntu-base-aarch64%3Alatest
[aarch64-arch-shield]: https://img.shields.io/badge/architecture-aarch64-blue.svg
[aarch64-dockerhub]: https://hub.docker.com/r/hassioaddons/ubuntu-base-aarch64
[aarch64-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/ubuntu-base-aarch64.svg
[aarch64-microbadger]: https://microbadger.com/images/hassioaddons/ubuntu-base-aarch64
[aarch64-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/ubuntu-base-aarch64.svg
[aarch64-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/ubuntu-base-aarch64.svg
[amd64-anchore-shield]: https://anchore.io/service/badges/image/63a8aaf6cfbdf81d423886cad39ce76aeba4936dfa2bfa38b49fe4a9f21b5a64
[amd64-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fubuntu-base-amd64%3Alatest
[amd64-arch-shield]: https://img.shields.io/badge/architecture-amd64-blue.svg
[amd64-dockerhub]: https://hub.docker.com/r/hassioaddons/ubuntu-base-amd64
[amd64-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/ubuntu-base-amd64.svg
[amd64-microbadger]: https://microbadger.com/images/hassioaddons/ubuntu-base-amd64
[amd64-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/ubuntu-base-amd64.svg
[amd64-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/ubuntu-base-amd64.svg
[armhf-anchore-shield]: https://anchore.io/service/badges/image/33bef0370fe095d5e6cfa7687cd0c28c5afae052b4177c4864d9792bc94905a1
[armhf-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fubuntu-base-armhf%3Alatest
[armhf-arch-shield]: https://img.shields.io/badge/architecture-armhf-blue.svg
[armhf-dockerhub]: https://hub.docker.com/r/hassioaddons/ubuntu-base-armhf
[armhf-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/ubuntu-base-armhf.svg
[armhf-microbadger]: https://microbadger.com/images/hassioaddons/ubuntu-base-armhf
[armhf-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/ubuntu-base-armhf.svg
[armhf-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/ubuntu-base-armhf.svg
[circleci-shield]: https://img.shields.io/circleci/project/github/hassio-addons/addon-ubuntu-base.svg
[circleci]: https://circleci.com/gh/hassio-addons/addon-ubuntu-base
[codeclimate-shield]: https://img.shields.io/badge/code%20climate-protected-brightgreen.svg
[codeclimate]: https://codeclimate.com/github/hassio-addons/addon-ubuntu-base
[commits-shield]: https://img.shields.io/github/commit-activity/y/hassio-addons/addon-ubuntu-base.svg
[commits]: https://github.com/hassio-addons/addon-ubuntu-base/commits/master
[contributors]: https://github.com/hassio-addons/addon-ubuntu-base/graphs/contributors
[discord-shield]: https://img.shields.io/discord/330944238910963714.svg
[discord]: https://discord.gg/c5DvZ4e
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/?u=frenck
[frenck]: https://github.com/frenck
[gitlabci-shield]: https://gitlab.com/hassio-addons/addon-ubuntu-base/badges/master/pipeline.svg
[gitlabci]: https://gitlab.com/hassio-addons/addon-ubuntu-base/pipelines
[i386-anchore-shield]: https://anchore.io/service/badges/image/b264466afeaa4fdb54cc4e82ba8e4f916a7893a63f474275474441a3fbb8d65b
[i386-anchore]: https://anchore.io/image/dockerhub/hassioaddons%2Fubuntu-base-i386%3Alatest
[i386-arch-shield]: https://img.shields.io/badge/architecture-i386-blue.svg
[i386-dockerhub]: https://hub.docker.com/r/hassioaddons/ubuntu-base-i386
[i386-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/ubuntu-base-i386.svg
[i386-microbadger]: https://microbadger.com/images/hassioaddons/ubuntu-base-i386
[i386-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/ubuntu-base-i386.svg
[i386-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/ubuntu-base-i386.svg
[issue]: https://github.com/hassio-addons/addon-ubuntu-base/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[label-schema]: http://label-schema.org/
[license-shield]: https://img.shields.io/github/license/hassio-addons/addon-ubuntu-base.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2018.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[reddit]: https://reddit.com/r/homeassistant
[releases-shield]: https://img.shields.io/github/release/hassio-addons/addon-ubuntu-base.svg
[releases]: https://github.com/hassio-addons/addon-ubuntu-base/releases
[repository]: https://github.com/hassio-addons/repository
[s6]: http://skarnet.org/software/s6/overview.html
[semver]: http://semver.org/spec/v2.0.0.html
