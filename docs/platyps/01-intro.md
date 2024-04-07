# Introduction

The [PlatyPS module](https://learn.microsoft.com/en-us/powershell/utility-modules/platyps/create-help-using-platyps?view=ps-modules) will look at the output of `Get-Help -Module <your-module>` and then generate markdown files
representing the existing documentation available in the module. If the commands are missing some, or all
documentation, you'll find placeholders like `{{ Fill in the Description }}`.

## ICanHazDadJoke?

I didn't have to think about what kind of sample module to use for this workshop for long before landing on dad
jokes. You can run PlatyPS against any PowerShell module for practice, but to keep things easy, copy
and paste the following commands into PowerShell while at the root of this repository:

``` powershell
$moduleParams = @{
    Path              = New-Item ./sandbox/dadjokes/dadjokes.psd1 -Force
    RootModule        = 'dadjokes.psm1'
    Description       = 'Get dad jokes from the icanhazdadjoke.com API.'
    FunctionsToExport = 'Get-DadJoke', 'Find-DadJoke'
}

New-ModuleManifest @moduleParams

@'
--8<-- "platyps/dadjokes.psm1"
'@ | Set-Content -Path ./sandbox/dadjokes/dadjokes.psm1

Import-Module ./sandbox/dadjokes/ -PassThru

```
