#!/usr/bin/env bash

echo "starting ssd server"
service ssh start

mkdir -p /root/.local/share/io.parity.ethereum/signer
echo "0.0.0.0 parity-private.local" > /etc/hosts
echo "127.0.0.1 localhost" >> /etc/hosts
hostname

/parity/parity \
--config dev \
--datadir="/data" \
--jsonrpc-interface="0.0.0.0" \
--jsonrpc-cors="*" \
--jsonrpc-hosts=all \
--jsonrpc-port=8545 \
--rpccorsdomain="*" \
--ws-port=8546 \
--ws-interface=all \
--ws-apis=all \
--ws-origins=all \
--ws-hosts=all \
--ui-interface="0.0.0.0" \
--tx-gas-limit=7000000 \
--gas-cap=7000000 \
--gas-floor-target=10000 \
--reseal-max-period=5000 \
--ui-port=8180 \
--force-ui \
-lsigner=trace \
--unsafe-expose \
--ui-no-validation
