FROM ubuntu:24.04
RUN useradd -u 101 app
WORKDIR /home/app
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*
COPY updater.sh .
RUN chmod +x updater.sh
COPY init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh
ENTRYPOINT ["init.sh"]
USER app
CMD ["./updater.sh"]
