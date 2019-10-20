# cppcheck-docker

![](https://github.com/jubnzv/cppcheck-docker/workflows/Docker%20Image%20CI/badge.svg)

## Introduction

Dockerfile to build latest [cppcheck](https://github.com/danmar/cppcheck). Appropriate docker image on [dockerhub](https://cloud.docker.com/repository/docker/jubnzv1/cppcheck) updates daily using [github actions](https://github.com/jubnzv/cppcheck-docker/actions).

Main aims:

1. Ability to build the most recent version of [cppcheck](https://github.com/danmar/cppcheck). With this Dockerfile you can build the [lastest master](https://github.com/danmar/cppcheck/commits/master) branch.
2. Make the result image as small as possible. This Dockerfile uses [alpine linux](https://alpinelinux.org) and removes any unneeded file and strips the resulting cppcheck binary.
3. Easy to use. Only need to mount a directory to `/src` to start check.

## Installation

Clone this image from [dockerhub](https://cloud.docker.com/repository/docker/jubnzv1/cppcheck):

```basg
docker pull jubnzv1/cppcheck
```

Or build your own image:
```bash
git clone https://github.com/jubnzv/cppcheck-docker
cd cppcheck-docker
docker build -t jubnzv1/cppcheck .
```

## Usage

```bash
docker run -v $(pwd):/src jubnzv1/cppcheck
```

To allow <kbd>Ctrl</kbd> + <kbd>C</kbd> during cppcheck run use `-t` docker argument:

```bash
docker run -t -v $(pwd):/src jubnzv1/cppcheck
```

### Examples

#### Addons usage

To check whole codebase to MISRA 2012 compliance:
```
docker run --rm -t -v $(pwd):/src jubnzv1/cppcheck --addon=misra.py
```

## References

* [Cppcheck manual](http://cppcheck.sourceforge.net/manual.html)

