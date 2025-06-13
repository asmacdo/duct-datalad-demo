# Project: Duct + Datalad Demo for OHBM

## 🎯 Goal

Create a compelling, loopable live demo for OHBM that shows how `duct` and `datalad` can be composed to provide structured, reproducible execution of neuroimaging workflows.

The demo will:

- Showcase how `duct` logs command execution, resource usage, and outputs
- Use `datalad run` to capture versioned provenance and enable reruns
- Progressively build from simple commands to a real-world pipeline (`fmriprep`)
- Visualize outputs using `con-duct ls` and compare against `datalad` history
- Be visually engaging with styled commentary and potentially split-pane views

## 📽️ Demo Structure

Each stage introduces a new concept and feature:

### 1. Setup
- `datalad create`
- Add a dummy BOLD NIfTI file (`curl`)
- `datalad save`

### 2. Stage 1: Basic Execution
- `nib-ls sub-01_bold.nii.gz`
- Duct logs output, exit code
- Pedagogy: "Structured logging"

### 3. Stage 2: Resource Monitoring
- `du -sh sub-01_bold.nii.gz`
- Pedagogy: "Peak memory and CPU usage logged"

### 4. Stage 3: Output Tracking
- `gzip -k sub-01_bold.nii.gz`
- Pedagogy: "Track and commit new output files"

### 5. Stage 4: Real Analysis
- `fmriprep` (mocked or minimal run)
- Pedagogy: "End-to-end provenance with duct logs and datalad commits"

### 6. Final View: Comparison
- `tmux split-pane`
    - Left: `con-duct ls -f summary`
    - Right: `datalad log`, `ls outputs/`, or `git diff`

## 🛠️ High-Level TODO

- [ ] Write helper script: `stage_banner` to set terminal title and pedagogy text
- [ ] Define all commands and expected outputs (mock or real)
- Sections:
    - [ ] Setup: Build yoda directory structure for inputs, outputs, logs
    - [ ] Execution: Use datalad+duct to execute each
- [ ] Write `doitlive` bash script to drive demo (consider asciicinema)
- [ ] Add "miniature, 1 sentence lessons"
    - [ ] show off saved logs
    - [ ] use `con-duct` plot (e.g. resource graph)
    - [ ] use `con-duct` ls (e.g. command list) show off connection to datalad commits
- [ ] Configure `tmux` split view for final comparison section
- [ ] Test loopability and visual clarity
- [ ] Package or document dependencies (`duct`, `con-duct`, `datalad`, `nib-ls`, `fmriprep` or mock)

## 🤝 Audience

Neuroscientists, data managers, and reproducibility advocates at OHBM interested in:

- Transparent, structured execution
- Reproducible pipelines
- Clean integration of logging and version control
