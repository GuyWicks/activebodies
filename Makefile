.SILENT:

.PHONEY: build run

.DEFAULT: help

help:

clean:
	- [ -f build.flag ] && rm build.flag

build: build.flag

build.flag:
	docker build --tag guywicks/activebodies .
	docker images
	touch build.flag

start: start.flag

start.flag:
	- docker rm activebodies
	docker run -d -p 8000:80 --restart unless-stopped --name activebodies guywicks/activebodies
	touch start.flag
	sleep 1
	docker ps -a
	curl localhost:8000/home

stop:
	docker stop activebodies
	- @rm start.flag
