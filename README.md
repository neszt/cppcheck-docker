# cppcheck-docker

## Introduction

Dockerfile to build latest and any tagged version of [cppcheck](https://github.com/danmar/cppcheck).

Main aims:

1. Ability to build the most recent version of [cppcheck](https://github.com/danmar/cppcheck). With this Dockerfile you can build the [lastest main](https://github.com/danmar/cppcheck/commits/main) and any tagged version.

2. Make the result image as small as possible. This Dockerfile uses [alpine linux](https://alpinelinux.org) and removes any unneeded file and strips the resulting cppcheck binary.

3. Easy to use. Only need to mount a directory to /src to start check.

## Usage

### Available Multi-Arch Images

[CI/CD](https://github.com/neszt/cppcheck-docker/actions) will automatically build, test and push new images to container registries. Currently, the following registries are supported:

- [DockerHub](https://hub.docker.com/r/neszt/cppcheck-docker)
- [GitHub Container Registry](https://github.com/users/neszt/packages/container/package/cppcheck-docker)

### CLI

```bash
docker run -v $(pwd):/src neszt/cppcheck-docker
```

To allow <kbd>Ctrl</kbd> + <kbd>C</kbd> during cppcheck run use `-t` docker argument:

```bash
docker run -t -v $(pwd):/src neszt/cppcheck-docker
```

## References

[Cppcheck manual](http://cppcheck.sourceforge.net/manual.html)

## Build your own image

### Latest:
```bash
docker build -t cppcheck .
```

### For Specific version use any tag from [cppcheck tags](https://github.com/danmar/cppcheck/tags)
```bash
docker build --build-arg SOURCE_BRANCH=2.2 -t cppcheck .
```
