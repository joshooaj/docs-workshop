# Themes

## Material for MkDocs

![Material for MkDocs logo](../assets/images/material-logo2.svg){ align="left" width="150" }  

The only theme I ever use with MkDocs is [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/). The
repository owner and primary contributor, [Martin Donath (@squidfunk)](https://github.com/squidfunk), has managed to
build a sustainable open-source project and the theme is widely recognized as one of, if not the best themes available
in the MkDocs ecosystem.

## More themes

![Screenshot of MkDocs catalog repo](../assets/images/mkdocs-catalog.png)

While I have my personal favorite, there are a bunch of themes for MkDocs! Many of them are listed in a
[catalog](https://github.com/mkdocs/catalog?tab=readme-ov-file#-theming) on GitHub. Run the following command to install
a few to try out with this project:

``` powershell title="Command"
pip install mkdocs-terminal mkdocs-dracula-theme mkdocs-simple-blog
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
