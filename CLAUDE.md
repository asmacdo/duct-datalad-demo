# Duct + Datalad OHBM Demo

## Project Goal
@project-description.md: Create a compelling, loopable live demo for OHBM showing how `duct` and `datalad` compose to provide structured, reproducible execution of neuroimaging workflows.

## Duct Repository Context
@duct/: Python package for structured command execution logging
- Logs command execution, resource usage, and outputs
- Provides `con-duct` CLI for visualization and analysis
- Focus on transparent, reproducible pipeline execution

## Working Style
- Follow my global CLAUDE.md preferences for maintainable, readable code
- Create atomic changes that can be tested incrementally
- Stop after each change and show testing approach
- Discuss options before implementation - let me make decisions
- Value understanding over code generation

## Demo Architecture
- Use `datalad run` to capture versioned provenance
- Progressive complexity: simple commands → real-world pipeline (fmriprep)
- Visual engagement with `tmux` split-pane comparisons (stretch goal, not an initial goal)
- Showcase both `duct` logs and `datalad` history
- mocks are ok for development, actual demo should be "real"

## Dependencies
- `duct` and `con-duct` from @duct/ repository
- `datalad` for version control and provenance
- Neuroimaging tools: `nib-ls`, `fmriprep` (or mocks)
- Demo tools: `doitlive`, `tmux`, potentially `asciicinema`

## Notes
- Target audience: neuroscientists, data managers, reproducibility advocates
- Focus on clean integration of logging and version control
- Ensure loopability and visual clarity for live presentation
