# New-MarkdownHelp

There are a lot of cases where comment-based help is more than enough. Internal tools,
and side projects without any/many users besides yourself for example. Larger PowerShell
modules where you expect to have many users, or even experimental projects for which
you want to be recognized for your experience and attention to detail are great
candidates for web-based documentation.

The fastest way to get from comment-based help in the shell to web-based documentation
is to let PlatyPS generate markdown-based versions of your existing help.

## ICanHazMarkdown?

The following commands will import the dadjokes module (if it's not already imported)
and then generate two markdown files - one for each function in the module.

``` powershell title="Command"
Import-Module ./sandbox/dadjokes/ -PassThru # (1)!
New-MarkdownHelp -Module dadjokes -OutputFolder ./sandbox/docs/commands -Force # (2)!
```

1. A module needs to be imported for PlatyPS to "see" it. It will be auto-loaded
   if necessary, but in this case our module isn't installed so we need to import
   it ourselves.
2. This will create a new *.md file for each command in the dadjokes module.  
   __Warning__: The `Force` parameter will overwrite existing files, but there shouldn't be any here yet.  
