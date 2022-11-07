#!/usr/bin/env bash
set -x

IBC_REFLECT_SEND_WASM=ibc_reflect_send.wasm

provenanced tx wasm store "$IBC_REFLECT_SEND_WASM" \
    --instantiate-everybody true \
    --from validator \
    --keyring-backend test \
    --home build/run/provenanced \
    --chain-id testing \
    --broadcast-mode block \
    --yes \
    --testnet --gas auto --gas-adjustment 1.5 --fees 6000000000nhash

provenanced tx wasm instantiate 1 "{}" \
    --from validator \
    --keyring-backend test \
    --home build/run/provenanced \
    --chain-id testing \
    --broadcast-mode block \
    --yes \
    --testnet --gas auto --gas-adjustment=2 --fees 5000000000nhash \
   --label test --admin "$(provenanced keys show -a validator --keyring-backend test --home build/run/provenanced --testnet)"