# Simplest possible static page generator

The scientists (me) have spent years (around 2 hours) in a lab (my room)
perfecting the greatest static page generator known to man (a single makefile)
and now I can proudly introduce to you - Pandoctor

Just make a workflow like this and you will get a github page that mirrors your
repo with html instead of md files!

```yml
name: Convert markdown to HTML and deploy to pages

on:
  push:
    branches: [ master ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v2

      - name: Convert md to html
        uses: FabricatorZayac/pandoctor@main # TODO: release version

      - name: Configure pages
        uses: actions/configure-pages@v3
      - name: Upload pages artifact
        uses: actions/upload-pages-artifact@v1
        with:
          path: '.'
      - name: Deploy pages
        uses: actions/deploy-pages@v2
```

Don't forget deploy keys! There should be info about that on one of the pages
about deploying to pages.

You can specify a path to a pandoc html template like this, if you want to
spice up your page or add css/js/whatever else

```yml
uses: FabricatorZayac/pandoctor@main
with:
  template: template.html
```
