#!/bin/bash

IDF_VER=v5.4.1

docker build \
  --build-arg IDF_VER=$IDF_VER \
  --build-arg USER_ID=espidf \
  -t esp32_build_container:$IDF_VER \
  -f dockerfile .

