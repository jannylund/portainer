#!/usr/bin/env bash

set -e
set -o pipefail
set -o xtrace

BASE=$(pwd)
IMAGE=portainer/portainer:latest
NAME=portainer

function pull() {
  docker pull ${IMAGE}
}

function clean() {
  if [[ $(docker ps -aq -f name=${NAME}) ]]; then docker rm -f ${NAME}; fi
}

function start() {
  docker run -d\
          --name ${NAME}\
          -p 9000:9000\
          --restart always\
          -v /var/run/docker.sock:/var/run/docker.sock\
          -v ${BASE}/portainer:/data\
          ${IMAGE}
} 

function stop() {
  docker stop ${NAME}
}

function update() {
  pull
  stop
  clean
  start
}


case "$1" in
  start)
    start
    ;;

  stop)
    stop
    ;;

  clean)
    clean
    ;;

  pull)
    pull
    ;;

  update)
    update
    ;;

  *)
    echo $"Usage: $0 {start|stop|clean|pull|update}"
esac