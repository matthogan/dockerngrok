#!/usr/bin/env bash

docker build --build-arg NGROK_AUTHTOKEN=$1 -t codejago/ngrok .
