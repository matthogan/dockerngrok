# dockerngrok

Expose a container to the internet via <https://ngrok.com>.

(for local testing)

## env

Put the `NGROK_AUTHTOKEN` env var into a `.env` file.

```
NGROK_AUTHTOKEN=...
```

## run

```shell
docker compose --env-file .env up
```

The endpoint is here: <https://dashboard.ngrok.com/cloud-edge/endpoints/>

## build

Build the ngrok image.

```shell
make build
```

Build the sample `unit` image.

```shell
make pyapp
```

## unit

nginx configurable server

<https://unit.nginx.org/>

Configuration for the unit-python:-

```json
{
  "listeners": {
    "*:8081": {
      "pass": "applications/python_app"
    }
  },
  "applications": {
    "python_app": {
      "type": "python",
      "path": "/www/python_app",
      "module": "wsgi"
    }
  }
}
```

`/www/python_app` is a path on the host.

Configuration for a static site:-

```json
{
  "listeners": {
    "0.0.0.0:8081": {
      "pass": "routes"
    }
  },

  "routes": [
    {
      "action": {
        "share": "/www/html$uri"
      }
    }
  ]
}
```

## python app

```python
➜  ~ cat www/python1/wsgi.py
def application(environ, start_response):
        start_response("200 OK", [("Content-Type", "text/plain")])
        return (b"+")
```
