#!/bin/sh
set -e
if [ -z $LISTEN_PORT ];then
	LISTEN_PORT=80
fi
if [ -z $PROXY_PORT ];then
	PROXY_PORT=443
fi
if [ -z $PROXY_URL ];then
	PROXY_URL=github.com
fi
TEXT="listen proxy\n    mode tcp\n    bind *:"$LISTEN_PORT"\n    dispatch "$PROXY_URL":"$PROXY_PORT
echo -e $TEXT > /usr/local/etc/haproxy/haproxy.cfg
exec haproxy -W -db -f /usr/local/etc/haproxy/haproxy.cfg