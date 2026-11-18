# examples/

Runnable configs, templates, and runbooks that make the corpus a *practical*
reference. Drop topic-specific artifacts here when bootstrapping a new repo —
mirroring what the founding repos ship:

- `mobile-apps-best-practices`: `examples/android-mvvm-clean/`, `examples/ci-github-actions/`, `examples/fastlane-*/`
- `nix-best-practices`: `examples/flake.nix`, `examples/disko-partition.nix`, `examples/integration-test.nix`, …
- `workshops-best-practices`: `examples/preflight.sh`, `examples/workshop-runbook-template.md`

## Rules of thumb

- Each example needs a short `README.md` (what it is, how to run it).
- Examples may reference corpus entries (`papers.yaml`) but must stand alone.
- Keep them small and single-purpose — this is a reference, not a monorepo.
