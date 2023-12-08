FROM alpine:3.16
LABEL MAINTAINER="Fabio Rauber <fabiorauber@gmail.com> / Marcelo Genaro <marcelogenaro@gmail.com>"

RUN apk add --no-cache bash postfix postfix-pcre cyrus-sasl cyrus-sasl-login 

COPY conf /etc/postfix

VOLUME ["/var/spool/postfix"]

ENTRYPOINT ["/etc/postfix/postfix-service.sh"]

EXPOSE 25
