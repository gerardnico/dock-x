# Dock-X - Docker commands driven by environment variables


## About

Are you tired to copy/paste docker command into your shell when
you are working on a Docker image?

`dock-x` is here to help.

Just run:
  * [dock-x build](#dock-x-build-environment-variables) to build your image
  * `dock-x start` to start your container
  * `dock-x push` to push your image
  * [dock-x push](#dock-x-run-environment-variables) to create a container
  * `dock-x stop` to stop your container
  * `dock-x shell` to run a shell (bash by default) into your container
  * `dock-x logs` to watch the logs of your container
No parameters needed, only environment variables.

Do you want to build and start your container?
```bash
dock-x build && dock-x run
alias dx=dock-x
dx build && dx run
```

## How it works

`dock-x` command fills automatically docker parameters from environment variables.

Create:
* an `.envrc` file at the root of your project
```bash
export DOCK_X_TAG=16.3-latest # the tag of the image (default to latest)
export DOCK_X_NAME=postgres # the name of the image (mandatory)
export DOCK_X_NAMESPACE=gerardnico # the image namespace (mandatory)
export DOCK_X_REGISTRY=ghcr.io # the registry (default to docker.io)
export DOCK_X_PORTS=80=80,443=443 # the port to opens (none by default)
```
* Source your env file (Tip: Do it automatically with an env manager such as [direnv](https://direnv.net/))
```bash
source .envrc
```
* Install `dock-x` with [homebrew](https://brew.sh/)
```bash
brew install --HEAD gerardnico/tap/dockx
```
* Go into your project directory and run your command
```bash
dock-x run
# or
dock-x build
```


## List of environment variables supported by dock-x


### Image environment variables for all dock-x command

```bash
# the registry of the image 
DOCK_X_REGISTRY=ghcr.io # the registry of the image (default to docker.io, ie empty string)
# the namespace of the image
DOCK_X_NAMESPACE=gerardnico
# the tag of the image (default to latest)
DOCK_X_TAG=16.3-latest
# the name of the image
DOCK_X_NAME=postgres
```


### `dock-x run` environment variables

The env of the `dock-x run` command
```bash
 # the name of the container created (Default to dock-x)
export DOCK_X_CONTAINER=containername
# the ports to open (Default to empty) 
export DOCK_X_PORTS=5432:5432,8080 
# the user that will run the image (1000 is the value for a WSL user) Default to empty 
export DOCK_X_USER=1000:1000 
# the groups of the user (Default to empty)
export DOCK_X_USER_GROUPS=postgres,root 
# The shell app to run with `dock-x shell` (default to /usr/bin/env bash)
export DOCK_X_SHELL="/usr/bin/env bash" 
# All others options can be set in
export DOCK_X_RUN_OPTIONS="-d --privileged -v /sys/fs/cgroup/world.scope:/sys/fs/cgroup:rw"
# You can define the command of the image
export DOCK_X_RUN_CMD="sleep 1d"
```

### `dock-x build` environment variables

The option of the `dock-x build` command:
```bash
# For instance, setting another context
export DOCK_X_BUILD_OPTIONS="Dockerfiles/molecule-debian/12.8"
```

## How to create your own run command

### With the DOCK_X_RUN environment variable

To create you own command, we recommend to set up them in your environment
```bash
# the options of the docker run command
DOCK_X_RUN_OPTIONS="-v "${PWD}"/mount/data:/data \
  --mount type=bind,source="${PWD}/bin/dbctl",target=/usr/local/bin/dbctl"
# the command 
DOCK_X_RUN_CMD="postgres -c shared_buffers=256MB -c max_connections=200"
```

### With a run wrapper script

You can always create a wrapper script.

> [!IMPORTANT]
> We handle the most known docker options but this method may fail 
> if the option is unknown. 


Example with:
* 2 mount
* and a command (`postgres`)
* with 2 arguments
```bash
#!/bin/bash

dock-x run \
  -v "${PWD}"/mount/data:/data \
  --mount type=bind,source="${PWD}/bin/dbctl",target=/usr/local/bin/dbctl \
  postgres \
  -c shared_buffers=256MB \
  -c max_connections=200
```



## Installation / Dependencies

You can install `dock-x` with [homebrew](https://brew.sh/)
```bash
brew install --HEAD gerardnico/tap/dockx
```

It will also install as dependency:
* [direnv-ext](https://github.com/gerardnico/direnv-ext)
* [direnv](https://direnv.net/)
* [bash lib](https://github.com/gerardnico/bash-lib)


### How to contribute

See [CONTRIBUTING.md](.github/CONTRIBUTING.md)

## Tip

Create a `dx` alias in your `.bashrc` to save some keystrokes.
```bash
alias dx="dock-x"
```

## Debug

Set
```bash
export BASHLIB_ECHO_LEVEL=4
dock-x command
```