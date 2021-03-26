FROM alpine
LABEL version="1.9.25"
VOLUME ["~/geth"]
ENV destination=stats.rinkeby.io
ARG destination=stats.rinkeby.io
ENV nodename=GethNodeInstance
ARG nodename=GethNodeInstance
ENV syncmode=fast
ARG syncmode=fast
ENV network=rinkeby
ARG network=rinkeby
RUN apk update
RUN apk upgrade
RUN apk add geth

CMD mkdir ~/geth
CMD ["/bin/sh", "-c", "geth --data-dir ~/geth --syncmode=$syncmode --${network} --ethstats=\"${nodename}:Respect my authoritah!@${destination}\""]

EXPOSE 3002
