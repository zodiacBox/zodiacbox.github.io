#!/bin/bash

HOME=`dirname "$0"`
TYPE_HOME="${HOME}/../type"
META_HOME="${HOME}/../test/meta"
IMG_HOME="${HOME}/../test/image"

if [[ $# != 4 ]]; then
    echo "Usage: $0 [json file] [png file] [start_index] [end_index] "
    echo "  ex) $0 box_1.json 1.png 100000 100001"
    exit 1
fi

target=$1
image=$2
start=$3
end=$4

for ((i=$start; i<=$end; i++)); do
    cp ${TYPE_HOME}/${target} ${META_HOME}/$i.json
    sed -i "s/__NFT_NUMBER__/${i}/g" ${META_HOME}/$i.json

    cp ${TYPE_HOME}/${image} ${IMG_HOME}/$i.png
done
