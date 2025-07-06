#!/bin/bash

docker run -it --rm --group-add=dialout --privileged -v $PWD:/project esp32_build_container:v5.4.1 bash
