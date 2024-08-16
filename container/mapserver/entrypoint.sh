#!/bin/sh

USER=${USER:-"root"}
GROUP=${GROUP:-"root"}

# TODO: ADD DYNAMIC SCRIPTS?. entrypoint.d?
# TODO: ADD WWW DIRECTORY.

if [ $(id -u) = '0' ]; then
    chown -R "$USER:$GROUP" /usr/local/apache2
fi
# IF NOT I'M ASSUMING THE FILES ARE THE SAME USER AS THE USER.
# TODO: SET ALL SERVING DATA AS WWW-DATA

# ONLY RUN TINI AS DAEMON
if [ $1 = "httpd" ]; then
    shift
    exec tini -- gosu "$USER:$GROUP" httpd $@
fi

exec $@
