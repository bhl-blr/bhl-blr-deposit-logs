#!/bin/bash
#
#
cat zenodo.json\
 | grep sha256\
 | preston track --algo md5\
 | preston zenodo --no-cache --algo md5 --remote file:///home/jhpoelen/bhl-blr/data
