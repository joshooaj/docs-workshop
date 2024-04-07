# Introduction

The last tool in the "Build Beautiful Docs" pipeline is the __pipeline__! I prefer to use GitHub and GitHub Actions,
which makes it a piece of cake to publish documentation to GitHub Pages. At this point in the workshop I will show you
the [GitHub Actions workflows](https://github.com/joshooaj/docs-workshop/actions) in this repository and trigger a
build of the sample DadJokes module and this website.

``` yaml title=".github/workflows/Docs.yml"
name: Docs

on:
  workflow_dispatch:
  push:
    branches:
      - main
    paths:
      - docs/**
      - mkdocs.yml
      - .github/workflows/Docs.yml

jobs:

  DeployDocs:
    name: Build and deploy docs
    runs-on: ubuntu-latest
    # Grant the minimum permissions necessary for this job to publish to GitHub Pages
    permissions:
      contents: write
      pages: write

    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      # Using caches in a larger project can really speed up builds
      - uses: actions/cache@v4
        with:
          key: ${{ runner.os }}-mkdocs
          path: .cache

      - name: MkDocs GH-Deploy
        if: github.ref == 'refs/heads/main'
        shell: pwsh
        run: .\build.ps1 -Bootstrap -Task PublishDocs

```
