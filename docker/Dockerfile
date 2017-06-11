FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get update
RUN apt-get install ethereum -y

RUN mkdir /usr/share/eth
ADD ./eth /usr/share/eth

EXPOSE 8545
EXPOSE 30303
EXPOSE 30303/udp

#RUN geth --fast --cache 1024

RUN geth --datadir /usr/share/eth/data init /usr/share/eth/genesis.json

ENTRYPOINT ["geth", "--dev", "--datadir", "'/usr/share/eth/data'", "--rpc", "--rpcaddr", "0.0.0.0", "--rpcport", "8545"]

#CMD ["/sbin/init"]