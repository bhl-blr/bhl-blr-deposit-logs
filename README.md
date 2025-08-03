Starting from 2024, records from the Biodiversity Heritage Library were deposited in Zenodo to help preserve their content and increase access. This repository describes the various deposit events that helped populate the https://zenodo.org/communities/bhl-blr collection. 

# Timeline

period | description | deposited lsids | logs (as gzipped nquads)
--- | --- | --- | --- 
2024-08-28/2024-08-29 | deposit of 20k bhl records from selected publications | [lsids.txt](bhl-zenodo-deposit-2024-08-28-lsids.txt) | [logs](bhl-zenodo-deposit-2024-08-28.nq.gz)
2024-09-03/2024-09-04 | deposit of 12k bhl records from selected publications | [lsids.txt](bhl-zenodo-deposit-2024-09-03-lsids.txt) | [logs](bhl-zenodo-deposit-2024-09-03.nq.gz)
2025-07-14 | deposit of 2k bhl records (excl. pensoft/scielo) without license mapping | [lsids.txt](bhl-zenodo-deposit-2025-07-14-take1-lsids.txt) | [logs](bhl-zenodo-deposit-2025-07-14-take1.nq.gz) 
2025-07-14/2025-07-24 | deposit of 200k bhl records (excl. pensoft/scielo) w/ license mapping | [lsids.txt](bhl-zenodo-deposit-2025-07-14-take2-lsids.txt) | [logs](bhl-zenodo-deposit-2025-07-14-take2.nq.gz)
2025-07-25/2025-08-02 | redo deposit of ~140k bhl records (excl. pensoft/scielo) w/ license mapping, with 101k bhl records being deposited addition to those already present in Zenodo | [lsids.txt](bhl-zenodo-deposit-2025-07-25-lsids.txt) | [logs](bhl-zenodo-deposit-2025-07-25.nq.gz)

## 2024-08-28

Workflow 

```
#!/bin/bash
#
#
cat zenodo.json\
 | grep sha256\
 | preston track --algo md5\
 | preston zenodo --no-cache --algo md5 --remote file:///home/jhpoelen/bhl-blr/data
```

## 2025-07-14 

### Workflow

First track the generated Zenodo metadata records:

```
cat bhl-zenodo-deposit-2025-07-03-metadata-non-scielo-non-pensoft.json.gz\
 | gunzip\
 | preston track\
 --algo md5\
 --data-dir prod-zenodo-data
```

Then, submit these records and their associated content (e.g., pdfs) to Zenodo.

```
#/bin/bash
#
#

preston ls\
       	--algo md5\
       	--data-dir prod-zenodo-data\
 | preston zenodo\
        --data-dir prod-zenodo-data\
       	--no-cache\
       	--remote file:///var/lib/preston/archives/bhl-blr/data,https://linker.bio
```

This workflow was stopped prematurely because the license mapping was not configured.

## 2025-07-14/2025-07-24

Same workflow as above, only with enabled license mapping configuration. 

For completeness:

```
cat bhl-zenodo-deposit-2025-07-03-metadata-non-scielo-non-pensoft.json.gz\
 | gunzip\
 | preston track\
 --algo md5\
 --data-dir prod-zenodo-data
```

Then, submit these records and their associated content (e.g., pdfs) to Zenodo.

```
#/bin/bash
#
#

preston ls\
       	--algo md5\
       	--data-dir prod-zenodo-data\
 | preston zenodo\
        --explicit-license-only\
       	--license hash://sha256/f0005cfa72a46c54c2d2386a3e7116f714e295b9740561648142308ba32ed1b7\
        --data-dir prod-zenodo-data\
       	--no-cache\
       	--remote file:///var/lib/preston/archives/bhl-blr/data,https://linker.bio
```

## 2025-07-25

Some 140k Zenodo metadata files associated with BHL parts appeared to not have been deposited for some reason, even through they were offered in the 2025-07-14 workflow.

The file ```bhl-zenodo-deposit-2025-07-25-metadata-non-scielo-non-pensoft-retry-candidates.json.gz``` contains the metadata jsonline objects that were not deposited. These are records containing lsids that were *not* included in the previous successful Zenodo deposits of 2025-07-14 and 2024-08-28 .
 
