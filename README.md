# Dock-X - Docker commands driven by environment variables


## About

Are you tired to copy/paste docker command into your shell when
you are working on a Docker image?

`dock-x` is here to help.

Just run:
  * `dock-x build` to build your image
  * `dock-x start` to start your container
  * `dock-x push` to push your image
  * `dock-x stop` to stop your container
  * `dock-x shell` to run a shell (bash by default) into your container
  * `dock-x logs` to watch the logs of your container
No parameters needed.

Do you want to build and start your container?
```bash
dock-x build && dock-x run
# with alias
dx build && dx run
```

## How it works

`dock-x` command fills automatically docker parameters from environment variables.

Create:
* an `.envrc` file at the root of your project
```bash
export DOCK_X_TAG=16.3-latest # the tag of the image
export DOCK_X_NAME=postgres # the repo
export DOCK_X_NAMESPACE=gerardnico # the user
export DOCK_X_REGISTRY=ghcr.io # the registry
export DOCK_X_PORTS=80=80,443=443 # the port to opens
```
* Source your env file (Tip: Do it automatically with an env manager such as [direnv](https://direnv.net/))
```bash
source .envrc
```
* Install `dock-x` with [homebrew](https://brew.sh/)
```bash
brew install --HEAD gerardnico/tap/dockx
# Add the libraries directory into your path in your `.bashrc` file
export PATH=$(brew --prefix bashlib)/lib:$PATH
```
* Go into your project directory and run your command
```bash
dock-x run
```


## List of environment variables supported by dock-x


### Image environment variables

```bash
DOCK_X_TAG=16.3-latest # the tag of the image
DOCK_X_NAME=postgres # the name of the image
DOCK_X_NAMESPACE=gerardnico # the namespace of the image
DOCK_X_REGISTRY=ghcr.io # the registry of the image
```


### Run options

```bash
DOCK_X_CONTAINER=postgres # the name of the container created
DOCK_X_PORTS=5432:5432,8080 # the ports to open
DOCK_X_USER=1000:1000 # the user that will run the image (1000 is the value for a WSL user)
DOCK_X_USER_GROUPS=postgres,root # the groups of the user
DOCK_X_SHELL="/usr/bin/env bash" # The shell app to run with `dock-x shell` (default to bash)
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
Then set the `BASHLIB_LIBRARY_PATH` 
```bash
export BASHLIB_LIBRARY_PATH=$(brew --prefix bashlib)/lib
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