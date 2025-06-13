#!/bin/bash

source ~/venvs/duct/bin/activate
source functions.sh

banner "Phase 0: Setup" "Fresh dataset with source data" "32"

# Configure datalad (off camera)
export DATALAD_UI_DIALOG=false
export DATALAD_UI_PROGRESSBAR=false