ARG ALPINE_VERSION=3.19.0
FROM alpine:${ALPINE_VERSION}

ARG NGROK_AUTHTOKEN=NOTSET

RUN apk add --no-cache wget bash

# download and install the package
RUN cd /tmp \
  && wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz \
  && tar -xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin \
  && rm ngrok-v3-stable-linux-amd64.tgz

# Add start.sh script
ADD start.sh /start.sh
# Give execute permissions to the script
RUN chmod +x /start.sh

# least priviledge:- no need to run as root
RUN addgroup -g 1000 appuser && adduser -u 1000 -G appuser -s /bin/sh -D appuser
USER appuser

# ngrok config
ADD ngrok.yml /ngrok.yml
ENV NGROK_AUTHTOKEN=${NGROK_AUTHTOKEN}

# ngrok port
EXPOSE 4040
# app port
EXPOSE 8081

# run start.sh script
ENTRYPOINT ["/start.sh"]
