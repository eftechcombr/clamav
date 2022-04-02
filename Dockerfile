from debian:stable-slim

RUN apt-get update \
  && apt-get --no-install-recommends install -y clamav-daemon clamav-freshclam 

ADD clamd.conf /etc/clamav/

RUN freshclam \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 3310/tcp

ENTRYPOINT ["/usr/sbin/clamd" ]

CMD [ "--foreground=true" ]
