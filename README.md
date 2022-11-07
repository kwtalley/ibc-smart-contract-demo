# ibc-smart-contract-demo

## Notices

#### 0. :warning: wasms in this repo were built on `x86_64 GNU/Linux` :warning:

#### 1. environment
my test setup used two separate instances of provenance by modifying the `remote` chain Makefile `run-config` target with:
        
```shell
- $(BUILDDIR)/provenanced -t --home $(BUILDDIR)/run/provenanced init --chain-id=$(CHAIN_ID) testing2 --custom-denom=$(DENOM); \
```
_don't commit `Makefile` changes unless intended!!!_

#### 2. this is very poc so check scripts to make sure they are adjusted to your environment

## Relayer configuration

1. i added the following to **BOTH** Makefile `run-config` targets. it creates consistent accounts for the relayer to use.

```shell
printf 'awesome eye lock unable enforce brand myth meadow flavor book energy borrow cloth field general enemy industry expose snow swim police vehicle naive neck' | build/provenanced -t --home build/run/provenanced keys add relayer --recover
build/provenanced -t --home build/run/provenanced add-genesis-account relayer 100000000000000nhash --keyring-backend test
```

2. confirm ports, keys, etc in the relayer config. example included in this repo.


## Running the demo
1. `setup_local_chain.sh` and `setup_remote_chain.sh` (these configure and start the 2 chains)
2. `store_and_init_local_contract.sh` and `store_and_init_remote_contracts.sh`
3. `init_and_start_relayer.sh` for the relayer (takes several transactions to reach the `running` state)
4. `execute_contract.sh` performs a simple packet send from local -> remote with a final response back to local