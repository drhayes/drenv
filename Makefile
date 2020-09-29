.PHONY=build
build:
	docker build -t test:latest .

.PHONY=start
start:
	docker run -it --rm --init -v "$PWD:/app" test
