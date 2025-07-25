#!/bin/bash
#
# replace bhl's (e.g., 1901-1904) range notation with ISO8601 date range (e.g., 1901/1904)
# see https://github.com/bio-guoda/preston/issues/350

sed -E 's+"publication_date":"([0-9]{4})-([0-9]{4})"+"publication_date":"\1\/\2"+g'
