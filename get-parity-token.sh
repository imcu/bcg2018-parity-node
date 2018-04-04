#!/usr/bin/env bash
hyper exec -it parity mkdir -p /root/.local/share/io.parity.ethereum/signer
hyper exec -it parity /parity/parity signer new-token
