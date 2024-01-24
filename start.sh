#!/usr/bin/env bash

# nc -vl 8080 &
# python3 -m http.server 8080 &

# Start ngrok
ngrok http --config=/ngrok.yml localhost:8081
