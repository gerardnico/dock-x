% dock-x(1) Version Latest | Docker Commands driven by environment variables
# dock-x

Automated Docker Commands driven by environment variables

## Overview

Execute docker commands driven by environment variables

## SYNOPSIS


dock-x - Automated Docker Commands driven by environment variables

Usage:
```bash
dock-x command opts
```

Commands:

* build                           Build the image DOCK_X_NAMESPACE/DOCK_X_NAME:latest
* exec                            Exec into the container DOCK_X_CONTAINER
* env                             Print the actual dock-x env that drives the docker command
* shell                           Start the bash shell into the container DOCK_X_CONTAINER
* logs                            Logs of the container DOCK_X_CONTAINER
* push                            Push the image DOCK_X_NAMESPACE/DOCK_X_NAME:latest

Global Options:

* -h --help                       Show this help message

Actual Env:

* Image Registry    : DOCK_X_REGISTRY=docker.io
* Image Namespace   : DOCK_X_NAMESPACE=
* Image Name        : DOCK_X_NAME=
* Image Tag         : DOCK_X_TAG=latest
* Container Name    : DOCK_X_CONTAINER=dock-x
* Container User    : DOCK_X_USER=
* Container Port    : DOCK_X_PORTS=
* Container Shell   : DOCK_X_SHELL=/usr/bin/env bash