FROM alpine:latest

RUN apk add --no-cache openssh
COPY host_executor.sh remount.sh /

ENTRYPOINT [ "sh", "/remount.sh" ]
