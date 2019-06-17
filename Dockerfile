FROM alpine:edge
LABEL maintainer="OpsWay <support@opsway.com>"

RUN rm -rf /var/cache/apk/* && apk update && \
    apk add --update rsyslog rsyslog-tls && \
    rm -rf /var/cache/apk/*

ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ADD rsyslog.conf /etc/
ADD loggly.crt /etc/rsyslog.d/keys/ca.d/

EXPOSE 514
EXPOSE 514/udp
EXPOSE 514/tcp

CMD ["/tmp/run.sh"]
