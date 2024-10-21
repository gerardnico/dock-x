# dockenv documentation

Automated Docker Commands driven by environment variables

## Overview

Set environment variables and run derived docker command

## Index

* [dockenv_logs](#dockenv_logs)

### dockenv_logs

Get the logs


## Help


  Dockenv - Automated Docker Commands driven by environment variables

  Usage: dockenv <command> <opts>

  Commands:
    build                           Build the image ghcr.io/gerardnico/DOCKER_NAME:latest
    exec                            Exec into the container DOCKER_CONTAINER
    env                             Print the actual dockenv env that drives the docker command
    shell                           Start the bash shell into the container DOCKER_CONTAINER
    logs                            Logs of the container DOCKER_CONTAINER
    push                            Push the image ghcr.io/gerardnico/DOCKER_NAME:latest

  Global Options:
    -h --help                       Show this help message

  Actual Env:
    Image Registry    : DOCKER_REGISTRY=ghcr.io
    Image Namespace   : DOCKER_NAMESPACE=gerardnico
    Image Name        : DOCKER_NAME=
    Image Tag         : DOCKER_TAG=latest
    Container Name    : DOCKER_CONTAINER=dockenv
    Container User    : DOCKER_USER=
    Container Port    : DOCKER_PORTS=
    Container Shell   : DOCKER_SHELL=/bin/bash
