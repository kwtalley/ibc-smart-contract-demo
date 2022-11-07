#!/usr/bin/env bash
set -x

# on local chain
IBC_REFLECT_ADDRESS=tp14hj2tavq8fpesdwxxcu44rty3hh90vhujrvcmstl4zr3txmfvw9s96lrg8
# on remote chain
IBC_REFLECT_SEND_ADDRESS=tp1nc5tatafv6eyq7llkr2gv50ff9e22mnf70qgjlv737ktmt4eswrqf06p2p
# the version of the contracts common api
CHANNEL_VERSION=ibc-reflect-v1
#chain ids
LOCAL_CHAIN_ID=testing
REMOTE_CHAIN_ID=testing

hermes create channel \
--a-chain $LOCAL_CHAIN_ID \
--b-chain $REMOTE_CHAIN_ID \
--a-port wasm.$IBC_REFLECT_SEND_ADDRESS \
--b-port wasm.$IBC_REFLECT_ADDRESS \
--order ordered \
--channel-version $CHANNEL_VERSION \
--new-client-connection \
--yes

#hermes create channel --a-chain testing --a-port transfer --b-port transfer --a-connection connection-0

hermes start
