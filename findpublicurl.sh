#!/usr/bin/env bash
curl http://localhost:4040/api/tunnels | python -mjson.tool | grep public_url
