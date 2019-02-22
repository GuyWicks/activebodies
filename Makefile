.SILENT:

.PHONEY: build run

.DEFAULT: help

help:


clean: stop
	- @rm master.zip
	- @rm -rf activebodies-master
	- @rm *.flag
	- docker rm activebodies
	
build: build.flag


master.zip:
	@echo Download
	wget --quiet https://github.com/GuyWicks/activebodies/archive/master.zip

activebodies-master: master.zip
	@echo unzip
	unzip -qq master.zip
	
build.flag: activebodies-master
	docker build --tag guywicks/activebodies .
	docker images
	touch build.flag

start: start.flag

start.flag:
	- docker rm activebodies
	docker run -d -p 8000:80 --name activebodies guywicks/activebodies
	touch start.flag
	sleep 1
	docker ps -a
	curl localhost:8000
	

stop:
	docker stop activebodies
	- @rm start.flag
