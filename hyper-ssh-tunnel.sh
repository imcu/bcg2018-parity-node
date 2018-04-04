#!/usr/bin/env bash

ssh -p 22 -i ${HOME}/.ssh/id_rsa \
-L 8545:localhost:8545 \
-L 8546:localhost:8546 \
-L 8180:localhost:8180 \
root@209.177.91.31
