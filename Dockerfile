FROM alpine

COPY src /app

RUN addgroup appgroup && \
    adduser -S dockle appgroup

VOLUME [ "/var/run/docker.sock" ]

HEALTHCHECK --interval=1h --timeout=15s --start-period=5s --retries=2 CMD [ "/app/healthcheck.sh" ]

CMD [ "/app/hello-world.sh" ]

USER dockle
