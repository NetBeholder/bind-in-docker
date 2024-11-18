ARG BIND_VERSION=${BIND_VERSION}
#ARG BIND_VERSION=9.18
#ENV BIND_VERSION=${BIND_VERSION}

#ARG BIND_EXTERNAL_PORT
#ENV BIND_EXTERNAL_PORT=${BIND_EXTERNAL_PORT}

FROM internetsystemsconsortium/bind9:${BIND_VERSION}

RUN apk update && apk add \
    dumb-init \
    bash \
    bind-tools \
    inotify-tools \
    iproute2-ss \
    htop \
    nano \
    && rm -rf /var/cache/apk/*