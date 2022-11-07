#!/usr/bin/env bash

make clean build

build/provenanced -t --home build/run/provenanced init --chain-id=testing testing
build/provenanced -t --home build/run/provenanced keys add validator --keyring-backend test
build/provenanced -t --home build/run/provenanced keys add buyer --keyring-backend test
printf 'awesome eye lock unable enforce brand myth meadow flavor book energy borrow cloth field general enemy industry expose snow swim police vehicle naive neck' | build/provenanced -t --home build/run/provenanced keys add relayer --recover
build/provenanced -t --home build/run/provenanced add-genesis-root-name validator pio --keyring-backend test
build/provenanced -t --home build/run/provenanced add-genesis-root-name validator pb --restrict=false --keyring-backend test
build/provenanced -t --home build/run/provenanced add-genesis-root-name validator io --restrict --keyring-backend test
build/provenanced -t --home build/run/provenanced add-genesis-root-name validator provenance --keyring-backend test
build/provenanced -t --home build/run/provenanced add-genesis-root-name validator sc --restrict=false --keyring-backend test
build/provenanced -t --home build/run/provenanced add-genesis-account validator 100000000000000000000nhash --keyring-backend test
build/provenanced -t --home build/run/provenanced add-genesis-account buyer 100pio.ibc.usd,100000000000000nhash --keyring-backend test
build/provenanced -t --home build/run/provenanced add-genesis-account relayer 100000000000000nhash --keyring-backend test
build/provenanced -t --home build/run/provenanced add-genesis-marker 200000000000000000000nhash --manager validator --access mint,burn,admin,withdraw,deposit --activate --keyring-backend test
build/provenanced -t --home build/run/provenanced add-genesis-marker 1000pio.ibc.usd --manager validator --access mint,burn,admin,withdraw,deposit,transfer --activate --keyring-backend test --type restricted
build/provenanced -t --home build/run/provenanced gentx validator 1000000000000000nhash --keyring-backend test --chain-id=testing
build/provenanced -t --home build/run/provenanced collect-gentxs

VOTING_PERIOD=21s

cat ./build/run/provenanced/config/genesis.json | jq ' .app_state.gov.voting_params.voting_period="'${VOTING_PERIOD}'" ' | tee ./build/run/provenanced/config/genesis.json
cat ./build/run/provenanced/config/genesis.json | grep voting

make run
