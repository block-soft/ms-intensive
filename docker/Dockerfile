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

#geth --datadir '/usr/share/eth/data' --rpc --rpcaddr 0.0.0.0 --rpcport 8545 --rpccorsdomain "*" --unlock "0x2A511ffd046759b34b89A41381b782676367Ad39"
ENTRYPOINT ["geth", "--dev", "--datadir", "'/usr/share/eth/data'", "--rpc", "--rpcaddr", "0.0.0.0", "--rpcport", "8545"]

#CMD ["/sbin/init"]