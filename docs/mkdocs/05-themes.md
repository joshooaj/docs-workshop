# Themes

![Screenshot of MkDocs catalog repo](../assets/images/mkdocs-catalog.png)

There are a bunch of themes for MkDocs - many of them are listed in this
[catalog](https://github.com/mkdocs/catalog?tab=readme-ov-file#-theming). Run the following command to install a few to
experiment with:

``` powershell title="Command"
PS /> pip install mkdocs-terminal mkdocs-dracula-theme mkdocs-simple-blog
```

Now you can specify what theme to use when rendering your site by editing `mkdocs.yml`:

``` yaml title="sandbox/mkdocs.yml"
site_name: My Docs
theme:
  name: dracula # Options: mkdocs | readthedocs | material | terminal | dracula | simple-blog
```

<div class="result" markdown>

![.](../assets/images/mkdocs-dracula-theme.png)

</div>
