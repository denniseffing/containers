FROM alpine:3.22.3

ARG TARGETARCH
ARG ARCH=${TARGETARCH/arm64/Aarch64}
ARG ARCH=${ARCH/amd64/X86_64}
ARG VERSION

ENV HOME="/config"

USER root
WORKDIR /app

RUN \
    apk add --no-cache \
        bash \
        catatonit \
        curl \
        libc6-compat \
        libgcc \
    && mkdir -p /app/bin \
    && curl -fsSL -o /tmp/aws-signing-helper "https://rolesanywhere.amazonaws.com/releases/${VERSION}/${ARCH}/Linux/aws_signing_helper" \
    && mv -t /app/bin /tmp/aws-signing-helper \
    && chown -R root:root /app  \
    && chmod -R 755 /app \
    && mkdir -p /config  \
    && chown nobody:nogroup -R /config \
    && rm -rf /tmp/*

COPY . /

USER nobody:nogroup
WORKDIR /config
VOLUME ["/config"]

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]
