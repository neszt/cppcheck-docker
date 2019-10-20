# cppcheck-docker

## Introduction

Dockerfile to build latest [cppcheck](https://github.com/danmar/cppcheck).

Main aims:

1. Ability to build the most recent version of [cppcheck](https://github.com/danmar/cppcheck). With this Dockerfile you can build the [lastest master](https://github.com/danmar/cppcheck/commits/master) branch.

2. Make the result image as small as possible. This Dockerfile uses [alpine linux](https://alpinelinux.org) and removes any unneeded file and strips the resulting cppcheck binary.

3. Easy to use. Only need to mount a directory to /src to start check.

## Usage

```bash
docker run -v $(pwd):/src cppcheck
```

To allow <kbd>Ctrl</kbd> + <kbd>C</kbd> during cppcheck run use `-t` docker argument:

```bash
docker run -t -v $(pwd):/src cppcheck
```

## References

[Cppcheck manual](http://cppcheck.sourceforge.net/manual.html)

## Build your own image:

docker build -t cppcheck .
