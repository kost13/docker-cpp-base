#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo 'No Tern file specified.'
    exit 1
fi

TERN_TO_MD=tools/tern-to-markdown

cd $TERN_TO_MD 
make init
cd ../..

LICENSES_FILE=licenses.md
PACKAGES_FILE=packages.md

python ${TERN_TO_MD}/tern_to_md/generate_licenses_summary.py -i $1 -o ${LICENSES_FILE} -f block

LICENSES_HEADER="### Other licenses"

sed -i '/### Other licenses/Q' README.md
echo ${LICENSES_HEADER} >> README.md

cat ${LICENSES_FILE} >> README.md

rm ${LICENSES_FILE}

python ${TERN_TO_MD}/tern_to_md/generate_copyright_info.py -i $1 -o ${PACKAGES_FILE}
