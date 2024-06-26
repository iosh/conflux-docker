# confluxchain/conflux-rust

Conflux-rust is a Rust implementation of the Conflux protocol.
This is Conflux-rust's docker image.

**NOTE: From v2.0 the docker image's default config file is renamed from `default.toml` to `conflux.toml`**, if you want mount your own config file, please rename it to `conflux.toml`.
**NOTE: If you want use your own config file, need manually add this option `dev_pos_private_key_encryption_password = "your-pos-pwd"`**

## Tags

[Current tags](https://hub.docker.com/r/confluxchain/conflux-rust/tags)

`Warning`: These `default tags` image's `conflux.toml` will config a independent chain with 10 genesis accounts (each with 1000 CFX) and all unlocked, you can use it as local Dapp develop environment. 

**`Note`: the unlock process maybe need one or two minutes.**

**If you want run a `mainnet` or `testnet` node, you should use the `x.x.x-mainnet` or `x.x.x-testnet` tag.**

## How to run

Step 1 pull image from docker hub

```sh
$ docker pull confluxchain/conflux-rust
```

Step 2 run the image

### Quick run a local dev node

```sh
$ docker run -p 12537:12537 --rm --name cfx-node confluxchain/conflux-rust
```

### Run with your own config file and save data to host machine

You can attach an folder from local machine to container, which folder should contain conflux `config files`. You can download a zip file from Conflux-rust [release page](https://github.com/Conflux-Chain/conflux-rust/releases), the unziped folder will include a `hydra.toml or tethys.toml` or `testnet.toml`, rename it to `conflux.toml`, then you can use this folder as Conflux-rust run context folder. When conflux client runs up, chain data will also save to this folder。

```sh
$ docker run -p 12537:12537 -v /path-to-your-config-folder:/root/run --name cfx-node confluxchain/conflux-rust
```

This repository's `fullnode-configs` folder also include mainnet and testnet's config file.

## Docs

1. [Official doc - How to install and run conflux-rust](https://doc.confluxnetwork.org/docs/general/run-a-node/)
2. [How to run an Independent Chain](https://doc.confluxnetwork.org/docs/general/run-a-node/advanced-topics/running-independent-chain)
3. [Window 10 Conflux Studio docker setup introduction (Chinese doc)](https://forum.conflux.fun/t/topic/4280)

## Note

1. When use docker you can't use `jsonrpc_local_tcp_port` and `jsonrpc_local_http_port`, but in `dev` mode you can access local RPC on `jsonrpc_http_port`
2. Local dev node will not connect to `testnet` or `mainnet`, it is a independent chain
