#!/bin/bash

# DUCT + DATALAD OHBM Demo
# Execute with: doitlive play demo.sh

set -x

export DEMO_DIR=/home/austin/devel/sandbox/duct-datalad-ohbm-demo

./phase-0-0.sh

./phase-0-1.sh

mkdir /tmp/demo

cd /tmp/demo

datalad create demo-dataset

cd demo-dataset

datalad install -d . -s https://github.com/ReproNim/ds000003-demo inputs/data

$DEMO_DIR/phase-1-0.sh

mkdir -p outputs

datalad run -m "Inspect BOLD file with nib-ls" --input inputs/data/sub-02/func/sub-02_task-rhymejudgment_bold.nii.gz --output outputs/nib-ls-output.txt "nib-ls inputs/data/sub-02/func/sub-02_task-rhymejudgment_bold.nii.gz > outputs/nib-ls-output.txt"

$DEMO_DIR/phase-1-1.sh

git --no-pager log --oneline -1

$DEMO_DIR/phase-1-2.sh

git --no-pager diff --name-status HEAD~1 HEAD

cat outputs/nib-ls-output.txt

$DEMO_DIR/phase-1-3.sh

git --no-pager log -1


# Cleanup at end
cd /tmp
chmod -R +w demo
rm -rf demo
