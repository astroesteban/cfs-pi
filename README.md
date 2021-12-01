# cFS Pi

A Docker-based development environment for you to cross-compile NASA's Core
Flight System (cFS) to the Raspberry Pi.

## Description

The goal of this project is to provide an all-in-one environment for developing
and deploying of the NASA Core Flight System (cFS) flight software framework
to the Raspberry Pi. The [cFS](https://github.com/nasa/cFS) is an open-source
generic flight software architecture framework used on flagship spacecraft like
the Parker Solar Probe, Orion, and James Webb Space Telescope among others. In
this project I use the `Caelum RC4` version of cFS.

## Getting Started

### Dependencies

* Docker
* Visual Studio Code with the "Remote-Containers" extension
* Raspberry Pi with Raspberry Pi OS Lite

### Installing (TODO)

### Executing program

In order to compile cFS for your host operating system run the following:

```sh
make SIMULATION=native O=build-native OMIT_DEPRECATED=true install
```

To cross-compile cFS for the Raspberry Pi run the following:
```sh
make SIMULATION=raspberrypi O=build-raspberry OMIT_DEPRECATED=true install
```

## Help (TODO)

## Authors

* @astroesteban

## Version History

* 0.1
    * Initial Release

## License

This project is licensed under the Apache License - see hte LICENSE file for details

## Acknowledgments

* [NASA's Core Flight System](https://github.com/nasa/cFS)