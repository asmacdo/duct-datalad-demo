#!/bin/bash

source ~/venvs/duct/bin/activate
source functions.sh

banner "Phase 0: Setup" "• Create fresh datalad dataset
• Install neuroimaging data from ReproNim" "32"

# Configure datalad (off camera)
export DATALAD_UI_DIALOG=false
export DATALAD_UI_PROGRESSBAR=false