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

