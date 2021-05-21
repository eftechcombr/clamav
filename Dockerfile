from debian:10

RUN apt-get update && apt-get install -y clamav-daemon clamav-freshclam

ADD clamd.conf /etc/clamav/

RUN freshclam

EXPOSE 3310/tcp

ENTRYPOINT ["/usr/sbin/clamd" ]

CMD [ "--foreground=true" ]
