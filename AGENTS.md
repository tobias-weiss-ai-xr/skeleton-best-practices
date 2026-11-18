# AGENTS.md — Working in a *-best-practices repo

> Read this first. It tells coding agents how to work safely here.
> (adapted from skeleton-research)

## Purpose

A **curated practical reference** corpus: a small (dozens), hand-reviewed
set of high-relevance sources about a topic's best practices, plus runnable
`examples/`. Papers live in `papers.yaml`, everything else is generated.
Signal over volume — do not bulk-ingest.

## Non-negotiable rules

1. **Never edit the generated README paper-list section by hand.** It is
   owned by `scripts/generate_readme.py` and delimited by the
   `## 📚 Paper list` … `## 📖 Citation` markers. Edit `papers.yaml`, then
   regenerate. Other README prose is free to edit.
2. **Never edit `docs/papers.json` or `docs/research/*.md` by hand.** They
   are pipeline outputs.
3. **Never invent papers.** Every entry must have a real, verifiable `url`.
   If you cannot verify a paper exists, do not add it. Prefer a few
   relevant sources over many marginal ones (this corpus is curated, not
   exhaustive).
4. **Validate every entry** with `python3 scripts/validate_papers.py --fix --sort`
   — schema, URL normalization, duplicates, date sanity.
5. **After any `papers.yaml` change, run** `make validate && make check &&
   make test` and confirm green before declaring done.

## Pipeline

```
papers.yaml ──► scripts/validate_papers.py   (quality gates, --fix)
     │
     ├──► scripts/generate_readme.py         (README paper list + docs/papers.json)
     ├──► scripts/standard_stats.py          (statistics.json)
     ├──► scripts/analysis/generate_reports.py (docs/research/*)
     └──► scripts/verify_sources.py          (link-rot audit)
```

Discovery (never auto-merges; always reviewed): `scripts/fetch/fetch_new_papers.py`,
`fetch_openalex_bulk.py`, `fetch_github_repos.py` / `_gitlab_` / `_codeberg_`.

## Bootstrap

See README: copy this skeleton, edit `config/taxonomy.yaml` (the ONLY file
to configure), seed a handful of real papers, let CI keep it healthy.
