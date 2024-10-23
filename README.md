# Dockenv - Docker commands driven by environment variables


## About

Are you tired to copy/paste docker command into your shell when
you are working on a Docker image?

`dockenv` is here to help.

Just run:
  * `dockenv build` to build your image
  * `dockenv start` to start your container
  * `dockenv push` to push your image
  * `dockenv stop` to stop your container
  * `dockenv shell` to run a shell (bash by default) into your container
  * `dockenv logs` to watch the logs of your container
No parameters needed.

Do you want to build and start your container?
```bash
dockenv build && dockenv run
```

## How it works

`dockenv` command fills automatically docker parameters from environment variables.

Create:
* an `.envrc` file at the root of your project
```bash
export DOCKER_TAG=16.3-latest # the tag of the image
export DOCKER_NAME=postgres # the repo
export DOCKER_NAMESPACE=gerardnico # the user
export DOCKER_REGISTRY=ghcr.io # the registry
export DOCKER_PORTS=80=80,443=443 # the port to opens
```
* Source your env file (Tip: Do it automatically with an env manager such as [direnv](https://direnv.net/))
```bash
source .envrc
```
* Install `dockenv` with [homebrew](https://brew.sh/)
```bash
brew install --HEAD gerardnico/tap/dockenv
# Add the libraries directory into your path in your `.bashrc` file
export PATH=$(brew --prefix bashlib)/lib:$PATH
```
* Go into your project directory and run your command
```bash
dockenv run
```


## List of environment variables supported by dockenv


### Image environment variables

```bash
DOCKER_TAG=16.3-latest # the tag of the image
DOCKER_NAME=postgres # the name of the image
DOCKER_NAMESPACE=gerardnico # the namespace of the image
DOCKER_REGISTRY=ghcr.io # the registry of the image
```


### Run options

```bash
DOCKER_CONTAINER=postgres # the name of the container created
DOCKER_PORTS=5432:5432,8080 # the ports to open
DOCKER_USER=1000:1000 # the user that will run the image (1000 is the value for a WSL user)
DOCKER_USER_GROUPS=postgres,root # the groups of the user
DOCKER_SHELL=/bin/bash # The shell app to run with `dockenv shell` (default to bash)
```

## How to create your own run command

If you want to set other options/arguments, you need 
to create a bash file and use it as it was a docker command

Example with:
* 2 mount
* and a command (`postgres`)
* with 2 arguments
```bash
#!/bin/bash

dockenv run \
  -v "${PWD}"/mount/data:/data \
  --mount type=bind,source="${PWD}/bin/dbctl",target=/usr/local/bin/dbctl \
  postgres \
  -c shared_buffers=256MB \
  -c max_connections=200
```

### How to contribute

See [CONTRIBUTING.md](.github/CONTRIBUTING.md)

## Installation / Dependencies

You can install `dockenv` with [homebrew](https://brew.sh/)
```bash
brew install --HEAD gerardnico/tap/dockenv
```

It will also install as dependency:
* [direnv-ext](https://github.com/gerardnico/direnv-ext)
* [direnv](https://direnv.net/)
* [bash lib](https://github.com/gerardnico/bash-lib)


