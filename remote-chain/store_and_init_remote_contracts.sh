#!/usr/bin/env bash
set -x

IBC_REFLECT_WASM=ibc_reflect.wasm
REFLECT_WASM=reflect.wasm

provenanced tx wasm store $REFLECT_WASM \
    --instantiate-everybody true \
    --from validator \
    --keyring-backend test \
    --home build/run/provenanced \
    --chain-id testing2 \
    --broadcast-mode block \
    --yes \
    --testnet \
    --gas auto --gas-adjustment 1.5 --fees 6000000000nhash \
    --node tcp://localhost:36657

provenanced tx wasm store $IBC_REFLECT_WASM \
    --instantiate-everybody true \
    --from validator \
    --keyring-backend test \
    --home build/run/provenanced \
    --chain-id testing2 \
    --broadcast-mode block \
    --yes \
    --testnet \
    --gas auto --gas-adjustment 1.5 --fees 6000000000nhash \
    --node tcp://localhost:36657

provenanced tx wasm instantiate 1 '{"reflect_code_id":1}' \
    --from validator \
    --keyring-backend test \
    --home build/run/provenanced \
    --chain-id testing2 \
    --broadcast-mode block \
    --yes \
    --testnet --gas auto --gas-adjustment=2 --fees 5000000000nhash \
   --label test --admin "$(provenanced keys show -a validator --keyring-backend test --home build/run/provenanced --testnet)" \
   --node tcp://localhost:36657

