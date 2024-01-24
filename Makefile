# make build NGROK_AUTHTOKEN=<token>
NGROK_AUTHTOKEN ?= ""

# tell make that build is not a file so run the build command
.PHONY: build
build:
# docker build --build-arg NGROK_AUTHTOKEN=$(NGROK_AUTHTOKEN) -t codejago/ngrok .
	docker build -t codejago/ngrok .

.PHONY: pyapp
pyapp:
	docker build -t codejago/pyapp1 -f Dockerfile.pyapp .
