# Contributions to this Project

## Contributions Welcome

Contributions to this project are always welcome, no matter how large or small. However, all contributing must follow the project's guidelines, conventions, and workflow.

## General Rules

This project follows ISO/TC 204 collaborative vocabulary practices. Public site: [https://isotc204.org/iso14812](https://isotc204.org/iso14812).

By providing a contribution to this project, contributors agree to submit their materials according to the project's [license](LICENSE.md) (where present) and the terms applicable to ISO vocabulary content distributed from this repository.

## Shared tooling

Version-control workflows and `scripts/versioning.py` follow the patterns maintained in
[`ISO-TC204/ontology-shared-scripts`](https://github.com/ISO-TC204/ontology-shared-scripts).
Thin workflow callers in `.github/workflows/` invoke the reusable versioning and deploy workflows from that repository.

## Pull requests and VERSION

All changes go through pull requests. Every PR must set the root [`VERSION`](VERSION) file.

The `validate-version` check compares your PR's `VERSION` to **`RELEASES` on the upstream base branch** (not whatever happens to be on your fork). You do **not** need a perfect local sync of `RELEASES` for the check to make sense.

### Set VERSION

```bash
# see what upstream already released, then set VERSION to the suggestion
python3 scripts/versioning.py suggest --releases RELEASES
```

Ontology change (must be greater than the latest SemVer on upstream `RELEASES`):

```text
version: 1.2.3-alpha.1
```

Documentation-only (SemVer unchanged; add a date):

```text
version: 1.2.3
doc-only: 2026-07-27
```

Validate locally before opening the PR:

```bash
python3 scripts/versioning.py validate --releases RELEASES
```

### Keep your fork clean

Release automation runs **only on the canonical ISO-TC204 repository**, not on forks. Still, prefer:

1. Branch from latest upstream `main`
2. Make your edits + one `VERSION` bump
3. Open the PR (GitHub **Squash and merge** is recommended so one commit lands upstream)

If your fork `main` has drifted (extra `chore(release):` bot commits, VERSION ahead of upstream):

```bash
git fetch https://github.com/ISO-TC204/iso14812.git main:upstream-main
git checkout main
git reset --hard upstream-main
git push --force-with-lease origin main
```

Then create a fresh feature branch for new work.

### Maintainer setup

1. Protect `main` and require the **`validate-version`** status check.
2. Prefer **Squash and merge** only for PRs into `main`.
3. After merge, `release-on-merge` stamps ontology TTL (when applicable), appends `RELEASES`, creates a GitHub Release/tag, and deploys the MkDocs site via the shared `update_release` workflow.
