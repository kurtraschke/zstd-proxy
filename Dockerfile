FROM node:lts

RUN apt-get update && apt-get install -y liburing-dev && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

COPY . /opt/zstd-proxy

RUN (cd /opt/zstd-proxy && yarn install && yarn run build) && yarn global add /opt/zstd-proxy

ENTRYPOINT ["/usr/local/bin/zstd-proxy"]
