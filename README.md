# Cloud Native builder for C++
[![Build](https://github.com/pim-huisman/cppbuilder/actions/workflows/build.yml/badge.svg)](https://github.com/pim-huisman/cppbuilder/actions/workflows/build.yml)

## About
This project is used to create a Cloud Native builder for C++.

The CNB builder and runner images used can be found at [pim-huisman/hera-images](https://github.com/pim-huisman/hera-images).

## Using the builder
The published builder will be made available on Docker hub. This project contains the source and is used to build it.

See [Docker hub](https://hub.docker.com/r/pimhuisman/cppbuilder).

```docker pull pimhuisman/cppbuilder:<version>```

## Building images with the builder
To use the builder issue a command as follows:

```pack build my-app -B pimhuisman/cppbuilder:jammy```

After the build has completed, the resulting images can be started:

```docker run --rm my-app ```

## Maintaining
This project is aimed to have a straightforward maintenance by using all relevant automation that we can.

## Contributing
This project is open for any contributions that you might have. Bugfixes and feature enhancements are very welcome.

If you'd like to implement a major new feature or change some fundamentals of the project please send me a DM to discuss.

## License
This project is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for the full license text.