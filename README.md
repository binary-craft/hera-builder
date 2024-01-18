# Cloud Native builder for C and C++
[![Build and push](https://github.com/binary-craft/hera-builder/actions/workflows/build-and-push.yml/badge.svg)](https://github.com/binary-craft/hera-builder/actions/workflows/build-and-push.yml)
[![Check for base image updates](https://github.com/binary-craft/hera-builder/actions/workflows/check-base-image-updates.yml/badge.svg)](https://github.com/binary-craft/hera-builder/actions/workflows/check-base-image-updates.yml)

## About
This project is used to create a Cloud Native builder for C and C++.

The CNB builder and runner base images used can be found at [binary-craft/hera-images](https://github.com/binary-craft/hera-images).

## Using the builder
The published builder will be made available on Docker hub. This project contains the source and is used to build it.

See [Docker hub](https://hub.docker.com/r/bincraft/hera-builder).

```docker pull bincraft/hera-builder:<version>```

## Supported tools and buildpacks
The following tools are supported through these buildpacks:
- [CMake](https://cmake.org) with [binary-craft/cmakepack](https://github.com/binary-craft/cmakepack)
- [Conan](https://conan.io) with [binary-craft/conanpack](https://github.com/binary-craft/conanpack)
- [Meson](https://mesonbuild.com) with [binary-craft/mesonpack](https://github.com/binary-craft/mesonpack)

See the specific buildpacks for more details about the compilers, linkers and generators that they support.

## Building images with the builder
Make sure to trust the builder to speed up build times:

```pack config trusted-builders add bincraft/hera-builder:jammy```

To use the builder issue a command as follows:

```pack build my-app -B bincraft/hera-builder:jammy```

After the build has completed, the resulting images can be started:

```docker run --rm my-app ```

## Maintaining
This project is aimed to have a straightforward maintenance by using all relevant automation that we can. Automation is used for:
- Building and pushing the builder on any relevant changes to the `main` branch.
- Checking for upstream [Hera base images](https://github.com/binary-craft/hera-images) updates and automatically integrating them.

## Contributing
This project is open for any contributions that you might have. Bugfixes and feature enhancements are very welcome.

If you'd like to implement a major new feature or change some fundamentals of the project please send me a DM to discuss.

## License
This project is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for the full license text.