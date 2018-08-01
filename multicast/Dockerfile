ARG BUILD_FROM=hassioaddons/ubuntu-base-amd64:2.0.0
FROM ${BUILD_FROM}

# Setup base system
ARG BUILD_ARCH=amd64

RUN \
    URL="http://archive.ubuntu.com/ubuntu/" \
    && if [ "${BUILD_ARCH}" = "armhf" ] || [ "${BUILD_ARCH}" = "aarch64" ]; then \
    URL="http://ports.ubuntu.com/ubuntu-ports/"; \
    fi \
    && echo "deb ${URL} xenial universe" \
    > /etc/apt/sources.list.d/xenial-universe.list \
    \
    && echo "deb ${URL} xenial main" \
    > /etc/apt/sources.list.d/xenial-main.list \
    \
    && apt-get update \
    \
    && apt-get install -y --no-install-recommends \
    avahi-daemon \
    avahi-discover \
    build-essential \
    libnss-mdns \
    libavahi-compat-libdnssd-dev \
    nodejs \
    npm \
    mongodb-server=1:2.6.10-0ubuntu1 \
    \
    && rm -rf /tmp/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/* \
    && rm -rf /var/{cache,log}/*

RUN npm install -g multicast

# Copy root filesystem
COPY rootfs /

# Link multicast config

# Build arugments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Multicast" \
    io.hass.description="A persistent solution to presenting content across multiple Chromecast devices." \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Juan Ignacio Donoso <jidonoso@gmail.com>" \
    org.label-schema.description="A persistent solution to presenting content across multiple Chromecast devices." \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Multicast" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/superhawk610/multicast" \
    org.label-schema.usage="https://github.com/superhawk610/multicast/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/platanus/hassio-addon-multicast" \
    org.label-schema.vendor="Platanus Hass.io Add-ons"
