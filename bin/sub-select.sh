#!/bin/bash
#
# select specific lines from collections of Zenodo metadata jsonline objects
#

awk 'NR == FNR{a[$0]; next};FNR in a'\
 non-deposited-meta-linenumbers.tsv\
 <(cat bhl-zenodo-deposit-2025-07-03-metadata-non-scielo-non-pensoft.json.gz | gunzip)
