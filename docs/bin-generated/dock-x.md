% dock-x(1) Version Latest | Quick and Easy Docker Commands driven by environment variables
# NAME

Quick and Easy Docker Commands driven by environment variables

# SYNOPSIS


dock-x - Quick and Easy Docker Commands driven by environment variables

Usage:
```bash
dock-x command opts
```

Commands:

* build                           Build the image ghcr.io/gerardnico/DOCK_X_NAME:latest
* env                             Print the dock-x env
* exec                            Exec into the container DOCK_X_CONTAINER
* env                             Print the actual dock-x env that drives the docker command
* logs                            Logs of the container DOCK_X_CONTAINER
* push                            Push the image ghcr.io/gerardnico/DOCK_X_NAME:latest
* run                             Run the image ghcr.io/gerardnico/DOCK_X_NAME:latest
* shell                           Start a bash shell into the container DOCK_X_CONTAINER
* start                           Start the container DOCK_X_CONTAINER
* stop                            Stop the container DOCK_X_CONTAINER

Global Options:

* -h --help                       Show this help message

Actual Env:

* Image Registry    : DOCK_X_REGISTRY=ghcr.io
* Image Namespace   : DOCK_X_NAMESPACE=gerardnico
* Image Name        : DOCK_X_NAME=
* Image Tag         : DOCK_X_TAG=latest
* Container Name    : DOCK_X_CONTAINER=dock-x
* Container User    : DOCK_X_USER=
* Container Port    : DOCK_X_PORTS=
* Container Shell   : DOCK_X_SHELL=/usr/bin/env bash
* Run options       : DOCK_X_RUN_OPTIONS=
