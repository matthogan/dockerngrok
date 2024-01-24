#!/usr/bin/env bash

# docker run --name pyapp -d -p 127.0.0.1:8081:8081 -v /home/matto/www/python1:/www/python_app codejago/pyapp1:latest
docker run --name pyapp -d -v $HOME/www/python1:/www/python_app codejago/pyapp1:latest
