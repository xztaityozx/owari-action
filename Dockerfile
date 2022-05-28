FROM debian:stable-slim as download
ARG OWARI_VERSION=2.0.2
RUN apt update && apt install -y wget tar

RUN wget https://github.com/xztaityozx/owari/releases/download/v$OWARI_VERSION/owari_${OWARI_VERSION}_Linux_x86_64.tar.gz
RUN tar xzf ./owari_${OWARI_VERSION}_Linux_x86_64.tar.gz

FROM gcr.io/distroless/base-debian11
COPY --from=download /owari /
ENTRYPOINT ["/owari" ]
