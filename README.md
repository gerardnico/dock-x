# Dockenv - Docker command driven by environment variables


## About

Are you tired to copy/paste docker command into your shell when
you are working on a Docker image?

`dockenv` is here to help.

Just run:
  * [dbuild](bin/dbuild) to build your image
  * [drun](bin/drun) to start your container
  * [dpush](bin/dpush) to push your image
  * [dstop](bin/dstop) to stop your container
  * [dbash](bin/dbash) to run a login bash into your container
  * [dlogs](bin/dlogs) to watch the logs of your container
No parameters needed.

Do you want to build and start your container?
```bash
dbuild && drun
```

## How it works

`dockenv` command fills automatically docker parameters from environment variables.

Create:
* an `.envrc` file at the root of your project
```bash
export DOCKER_TAG=16.3-latest # the tag of the image
export DOCKER_REPO=postgres # the repo
export DOCKER_USER=gerardnico # the user
export DOCKER_REGISTRY=ghcr.io # the registry
```
* Source your env file (Tip: Do it automatically with a env manager such as [direnv](https://direnv.net/))
```bash
source .envrc
```
* Install `dockenv` with [homebrew](https://brew.sh/)
```bash
brew install --HEAD gerardnico/tap/dockenv
```
* Go into your project directory and run your command
```bash
drun
```


## List of environment variables supported by dockenv


### Image URI

```bash
DOCKER_TAG=16.3-latest # the tag of the image
DOCKER_REPO=postgres # the repo
DOCKER_USER=gerardnico # the user
DOCKER_REGISTRY=ghcr.io # the registry
```


### Argument

```bash
DOCKER_CONTAINER=postgres # the name of the container created
DOCKER_PORTS=5432=5432,8080 # the ports to open
```

## How to contribue

See [CONTRIBUTING.md](.github/CONTRIBUTING.md)

## Installation / Dependencies

You can install `dockenv` with [homebrew](https://brew.sh/)
```bash
brew install --HEAD gerardnico/tap/dockenv
```

It will also install as dependency:
* [direnv-ext](https://github.com/gerardnico/direnv-ext)
* and [direnv](https://direnv.net/)
