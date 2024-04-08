# Update-MarkdownHelp

As time passes and your module grows and changes, your docs need to stay in sync.
When you add or remove parameters or change attributes, you want the documentation
to reflect that. And I hate to break it to you, but if you're reading this (and your name isn't ChatGPT)
then you're probably human, which means you can't be relied upon to keep the documentation
up to date by hand.

Fortuantely, `Update-MarkdownHelp` is there to update the "machine readable" parts
of your markdown help files like parameters, parameter sets, and attributes. And any
new parameters lacking a description will have a `{{ Fill in the Description }}`
placeholder you can search for as a part of your automation to ensure you don't
publish incomplete help by mistake.

## Demonstration

To see how PlatyPS treats existing help files, start by adding the highlighted parameter
to `Get-DadJoke` in `sandbox/dadjokes/dadjokes.psm1` after the `#!powershell $JokeId`
parameter on line 34.

``` powershell linenums="30" hl_lines="7-9" title="sandbox/dadjokes/dadjokes.psm1"
   param (
        [Parameter()]
        [Alias('Id')]
        [string]
        $JokeId,

        [Parameter()]
        [string]
        $PlatyPSTest
    )
```

``` powershell title="Command"
Import-Module ./sandbox/dadjokes/ -Force -PassThru # (1)!
Update-MarkdownHelp -Path ./sandbox/docs/commands/Get-DadJoke.md # (2)!
```

1. A module needs to be imported for PlatyPS to "see" it. And if it was already
   imported before making changes to it, we need to use `-Force` to tell PowerShell
   to re-import it.
2. This will create a new *.md file for each command in the dadjokes module.  
   __Warning__: The `Force` parameter will overwrite existing files, but there shouldn't be any here yet.  
