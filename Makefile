.PHONY: clean
clean:
	sh portainer.sh clean

.PHONY: stop
stop:
	sh portainer.sh stop

.PHONY: start
start:
	sh portainer.sh start

.PHONY: update
update:
	sh portainer.sh update

