VERSION=4.8.8.0

build:
	docker stop emby || true
	docker container prune -f
	docker build -t royzheng/emby:${VERSION} --progress=plain  . 2>&1 | tee build.log

start:
	docker run -d --name emby royzheng/emby:${VERSION}

stop:
	docker stop emby || true
	docker container prune -f

restart:
	make stop
	make start

push:
	docker push royzheng/emby:${VERSION}
	docker image tag royzheng/emby:${VERSION} royzheng/emby:latest
	docker push royzheng/emby:latest
	docker image tag royzheng/emby:latest royzheng/emby:${VERSION}

bash:
	docker exec -it emby sh


