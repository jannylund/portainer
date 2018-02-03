## Portainer wrapper

This is a simple wrapper around portrainer for running locally.

`make pull` will pull down the latest image (unless otherwise set in portainer.sh)

`make start` will spin up portainer with the data files stored in ./portainer

`make stop` will stop the container but not delete it.

`make clean` will force stop and delete the container.

`make update` will pull, stop, clean and start.