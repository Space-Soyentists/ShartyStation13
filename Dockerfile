# base = ubuntu + full apt update
FROM ubuntu:noble AS base
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y --no-install-recommends \
        ca-certificates

# byond = base + byond installed globally
FROM base AS byond
WORKDIR /byond

RUN apt-get install -y --no-install-recommends \
        curl \
        unzip \
        make \
        libstdc++6:i386 \
        libcurl4:i386 \
        python3

COPY dependencies.sh .

RUN . ./dependencies.sh \
    && curl -H "User-Agent: Monkestation2.0/1.0 CI Script" "http://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" -o byond.zip \
    && unzip byond.zip \
    && cd byond \
    && sed -i 's|install:|&\n\tmkdir -p $(MAN_DIR)/man6|' Makefile \
    && make install \
    && chmod 644 /usr/local/byond/man/man6/* \
    && curl -L "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp" -o /usr/local/bin/yt-dlp \
    && chmod a+rx /usr/local/bin/yt-dlp \
    && apt-get purge -y --auto-remove curl unzip make \
    && cd .. \
    && rm -rf byond byond.zip

# build = byond + tgstation compiled and deployed to /deploy
FROM byond AS build
WORKDIR /tgstation

RUN apt-get install -y --no-install-recommends \
        curl \
        rsync

COPY . .

RUN env TG_BOOTSTRAP_NODE_LINUX=1 tools/build/build \
    && tools/deploy.sh /deploy

# final = byond + runtime deps + rust_g + dreamluau + build
FROM byond
WORKDIR /tgstation

RUN apt-get install -y --no-install-recommends \
        libssl3:i386 \
        zlib1g:i386

COPY --from=build /deploy ./

VOLUME [ "/tgstation/config", "/tgstation/data" ]
ENTRYPOINT [ "DreamDaemon", "tgstation.dmb", "-port", "8888", "-trusted", "-close", "-verbose" ]
EXPOSE 8888
