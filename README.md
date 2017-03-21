# Chill-Netcat

A deliberately limited [Netcat](https://en.wikipedia.org/wiki/Netcat) implementation ([UDP](https://en.wikipedia.org/wiki/User_Datagram_Protocol) only).

An exercise in building a network enabled [systems program](https://en.wikipedia.org/wiki/System_programming) / [unikernel](https://en.wikipedia.org/wiki/Unikernel) with [OCaml](http://ocaml.org) / [MirageOS](https://mirage.io).

With minimal network related dependencies included the resulting binary has a size of ~3.3MB (on MacOS).

This project is based on the highly instructional ["Hello MirageOS World"](https://mirage.io/wiki/hello-world) guide and [mirage-skeleton](https://github.com/mirage/mirage-skeleton) code examples.

# Setup

Check the official [MirageOS installation](https://mirage.io/wiki/install) guide.

# Configure and build

Configure (e.g. MacOS):
```shell
mirage configure -t macosx
```

Get and build dependencies:
```shell
make depend
```

Build binary:
```shell
make
```

# Run

On MacOS:
```shell
./chill_netcat
```

On Xen (not yet..)