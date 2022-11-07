#!/usr/bin/env bash
set -x

CONTRACT_ADDR=$(provenanced query wasm list-contract-by-code 1 --home build/run/provenanced --testnet -o json | jq -r ".contracts[0]");

# be sure the channel is set correctly
provenanced tx wasm execute "$CONTRACT_ADDR" '{"check_remote_balance":{"channel_id":"channel-0"}}' \
    --from validator \
    --keyring-backend test \
    --home build/run/provenanced \
    --chain-id testing \
    --broadcast-mode block \
    --yes \
    --testnet --gas auto --gas-adjustment=2 --fees 5000000000nhash

watch "provenanced query wasm contract-state smart $CONTRACT_ADDR '{\"list_accounts\":{}}' -t -o json --home build/run/provenanced | jq"