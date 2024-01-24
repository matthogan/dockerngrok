#!/usr/bin/env bash

docker run --name ngrok -d -p 0.0.0.0:4040:4040 codejago/ngrok:latest
