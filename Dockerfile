FROM haproxy:1.8-alpine
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
STOPSIGNAL SIGTERM
CMD ["/entrypoint.sh"]