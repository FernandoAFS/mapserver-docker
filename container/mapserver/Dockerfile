
ARG BASE=httpd:bookworm

FROM ${BASE}

ENV DEBIAN_FRONTEND=noninteractive
RUN set -aux && \
    apt update && \
    apt install -y gosu tini cgi-mapserver libcap2-bin && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /usr/local/apache2/conf/httpd.d && \
    setcap 'cap_net_bind_service=+ep' /usr/local/apache2/bin/httpd


COPY --chmod=0755 ./entrypoint.sh /entrypoint.sh
COPY --chmod=0644 ./httpd.conf /usr/local/apache2/conf/httpd.conf
ENTRYPOINT ["/entrypoint.sh"]
CMD ["httpd", "-D", "FOREGROUND"]
