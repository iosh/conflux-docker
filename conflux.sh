#!/bin/bash
# init config
cd ./scripts
node initConfig.js
cd ..

# start conflux
cd ./run
conflux --config ./default.toml