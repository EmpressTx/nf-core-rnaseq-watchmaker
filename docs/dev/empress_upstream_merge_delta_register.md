# EmpressTx delta register (upstream sync)

This file tracks internal deltas after rebasing onto upstream `nf-core/rnaseq` `dev`.

## Keep (internal requirements retained)

- MultiQC report behavior via `/home/runner/work/nf-core-rnaseq-watchmaker/nf-core-rnaseq-watchmaker/assets/multiqc_config.yml`:
  - UMI-related report visibility
  - internal report ordering and failure summary emphasis
- Curated rRNA database manifest policy in `/home/runner/work/nf-core-rnaseq-watchmaker/nf-core-rnaseq-watchmaker/assets/rrna-db-defaults.txt`.
- Internal release annotation in `CHANGELOG.md` describing upstream sync and retained behaviors.

## Replace (legacy implementation swapped for upstream-native path)

- Legacy top-level workflow file:
  - dropped `/home/runner/work/nf-core-rnaseq-watchmaker/nf-core-rnaseq-watchmaker/workflows/rnaseq.nf`
  - replaced by upstream structured workflow under `/home/runner/work/nf-core-rnaseq-watchmaker/nf-core-rnaseq-watchmaker/workflows/rnaseq/main.nf`
- Legacy local wrappers replaced by upstream module/subworkflow wiring:
  - `/home/runner/work/nf-core-rnaseq-watchmaker/nf-core-rnaseq-watchmaker/modules/local/multiqc/main.nf`
  - `/home/runner/work/nf-core-rnaseq-watchmaker/nf-core-rnaseq-watchmaker/modules/local/umitools_prepareforrsem/main.nf`

## Drop (obsolete after upstream adoption)

- Direct dependency on pre-upstream local MultiQC process wrapper.
- Direct dependency on pre-upstream local `prepare-for-rsem` wrapper.

## Follow-up sync model

- Prefer upstream module/subworkflow updates over local forks.
- Keep pipeline-specific behavior in config-level overlays where possible.
- Update this file on each upstream sync to classify each internal delta as keep / replace / drop.
