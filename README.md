# skeleton-best-practices

Template for `*-best-practices` repos: a **curated practical reference**
corpus — a small, hand-reviewed set of high-relevance sources plus runnable
`examples/`. Distilled from
[mobile-apps](https://github.com/tobias-weiss-ai-xr/mobile-apps-best-practices),
[nix](https://github.com/tobias-weiss-ai-xr/nix-best-practices), and
[workshops](https://github.com/tobias-weiss-ai-xr/workshops-best-practices).

## Which skeleton? `-research` ≠ `-best-practices`

Two sibling skeletons fork from this family. Pick by what your corpus must be:

**`-best-practices`** (*this template*) — **curated reference.** A small
(dozens), hand-reviewed corpus of high-relevance sources plus runnable
`examples/` of real-world patterns. Good when **signal beats volume**: a
reading-committee-quality list you can defend entry by entry.

**`skeleton-research`** — **large living scholarly survey.** Bulk multi-source
discovery (arXiv, OpenAlex, dblp, Crossref, Europe PMC, Semantic Scholar,
GitHub/GitLab/Codeberg), concept-graph extraction, trend/gap analysis, daily
intelligence digest. Good when **coverage at scale**: hundreds–thousands of
papers, machine-assisted analysis.

Both share the same pipeline core (`scripts/fetch/*`, `validate_papers.py`,
`generate_readme.py`, …) and keep it in sync. Everything beyond the core
differs by design: this template adds lean ergonomics (Makefile, AGENTS.md,
tests) but deliberately omits the research machinery (no `ingest/`, no
concept-graph tooling, no news digest).

## Bootstrap a new repo (2 minutes)

```bash
git clone git@github.com:tobias-weiss-ai-xr/skeleton-best-practices.git my-topic-best-practices
cd my-topic-best-practices && rm -rf .git && git init   # fresh history
$EDITOR config/taxonomy.yaml    # the ONE file to edit: topic, categories, queries, keywords
make bootstrap                  # rewrite README/index/CITATION identity tokens
make validate                   # config + corpus sanity check
```

Then:

1. **Seed the corpus** — start small and hand-reviewable. Discover candidates
   with `python3 scripts/fetch/fetch_new_papers.py --months 12 --dry-run`
   (or `fetch_openalex_bulk.py`), then `--local` to append; or write a few
   known-good entries into `papers.yaml` yourself. Normalize with
   `python3 scripts/validate_papers.py --fix --sort` — empty corpus is fine
   until then (warning, not error).
2. **Edit README prose** (this file: context, goal, status). The paper list
   between `## 📚 Paper list

- [📚 Fundamentals](#fundamentals)
- [📚 Security](#security)
- [📚 Operations](#operations)

### Fundamentals

### Security

### Operations

## 📖 Citation` is generated — never edit
   it by hand.
3. **Add `examples/`** — runnable configs and runbooks are what make a
   best-practices repo practical, not just a reading list.
4. **Commit, push** — CI validates papers + README freshness on every PR,
   opens a weekly discovery PR, deploys the corpus + searchable paper browser
   to GitHub Pages.

## What's in the box

| Path | Purpose |
|------|---------|
| `Makefile` | `make validate` / `check` / `generate` / `test` / `all` |
| `config/taxonomy.yaml` | The only config file: categories, subcategories, queries, keywords |
| `papers.yaml` | The corpus — one structured entry per paper |
| `scripts/fetch/` | Discovery: arXiv, OpenAlex, GitHub/GitLab/Codeberg repos |
| `scripts/validate_papers.py` | Schema + quality gates (`--fix`, `--sort`) |
| `scripts/generate_readme.py` | README paper list + `docs/papers.json` (`--check` gate) |
| `scripts/standard_stats.py`, `analysis/generate_reports.py`, `visualize_statistics.py` | Statistics, literature review, plots |
| `scripts/verify_sources.py` + `verify-sources.yaml` | Link-rot audit |
| `scripts/export_bibtex.py` | BibTeX export |
| `tools/trend_scanner.py` | Keyword-burst / trend scan (used by reports) |
| `tests/` | Shared-core test suite (`make test`) |
| `docs/index.html` | Searchable paper browser (reads `papers.json`) |
| `AGENTS.md`, `CITATION.cff` | Agent rules; citation metadata |
| `.github/workflows/` | Validate on PR, weekly discovery PR, Pages deploy |

## Contributing back

Topic-specific tooling lives in the topic repos, not here — but shared-pipeline
improvements (bugfixes, new gates, better tests) belong in this template so
every bootstrap inherits them. Same rule applies upstream to
`skeleton-research`.

## 📚 Paper list

## 📖 Citation

Papers discovered via arXiv/OpenAlex; see `config/taxonomy.yaml` for the
configured queries. BibTeX export: `python3 scripts/export_bibtex.py`.
