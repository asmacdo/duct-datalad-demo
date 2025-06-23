#!/bin/bash

# DUCT + DATALAD OHBM Demo
# Execute with: doitlive play demo.sh

# For executing the script directly
# set -x

# Best if this is done ahead of the demo
# source ~/venvs/duct/bin/activate
# DEMO_DIR=/home/austin/devel/sandbox/duct-datalad-ohbm-demo
# export DEMO_DIR
# source functions.sh

./phase-0-0.sh

./phase-0-1.sh

mkdir /tmp/demo

cd /tmp/demo

datalad create demo-dataset

cd demo-dataset

datalad install -d . -s https://github.com/ReproNim/ds000003-demo sourcedata/raw

$DEMO_DIR/phase-1-0.sh

mkdir -p outputs

# TODO explain how inputs can be used with datalad run
datalad run -m "Inspect BOLD file with nib-ls" --input sourcedata/raw/sub-02/func/sub-02_task-rhymejudgment_bold.nii.gz --output outputs/nib-ls-output.txt "nib-ls {inputs} > {outputs}"

$DEMO_DIR/phase-1-1.sh

git --no-pager log --oneline -1

$DEMO_DIR/phase-1-2.sh

git --no-pager diff --name-status HEAD~1 HEAD

cat outputs/nib-ls-output.txt

$DEMO_DIR/phase-1-3.sh

git --no-pager log -1

$DEMO_DIR/phase-2.sh

duct -p duct_intro_ echo "test"

cat duct_intro_stdout

rm -f duct_intro_*

$DEMO_DIR/phase-3-0.sh

datalad install -d . -s ///repronim/containers code/containers


datalad run -m "Downgrade/Freeze mriqc container version" code/containers/scripts/freeze_versions --save-dataset=. bids-mriqc=0.16.0

datalad run -m "Remove ad-hoc option for mriqc for older frozen version" sed -i -e 's, --no-datalad-get,,g' .datalad/config

$DEMO_DIR/phase-3-1.sh
datalad run -m "Modify container config to use duct" "sed -i 's|cmdexec = |cmdexec = duct -p mriqc_run_ -- |' .datalad/config"


$DEMO_DIR/phase-3-2.sh

datalad containers-run -n bids-mriqc --input sourcedata/raw --output . '{inputs}' '{outputs}' participant group

$DEMO_DIR/phase-4-0.sh


$DEMO_DIR/phase-4-1.sh

con-duct ls mriqc_run_*

tail -20 mriqc_run_stdout

con-duct plot mriqc_run_usage.json

# Cleanup at end
cd /tmp
chmod -R +w demo
rm -rf demo
