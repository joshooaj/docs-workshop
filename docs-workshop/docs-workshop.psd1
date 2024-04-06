@{
    RootModule        = 'docs-workshop.psm1'
    # ModuleVersion is updated in the output directory using a PostAction on the StageFiles psake task. The version number is provided by nbgv.
    ModuleVersion     = '0.1.0'
    GUID              = '4db4b678-dc3f-47b1-bfe0-4ffc65ae03f4'
    Author            = 'joshooaj'
    CompanyName       = 'joshooaj'
    Copyright         = '(c) Joshua Hendricks. All rights reserved.'
    Description       = 'A basic PowerShell module structure I learned from a blog post by Warren Frame aka ramblingcookiemonster.'
    # FunctionsToExport is updated in the output directory by PowerShellBuild
    FunctionsToExport = '*'
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = '*'
    ScriptsToProcess  = @('Classes/DadJoke.ps1')
    PrivateData       = @{
        PSData = @{
            # Tags       = @()
            LicenseUri = 'https://github.com/joshooaj/docs-workshop/blob/main/LICENSE'
            ProjectUri = 'https://github.com/joshooaj/docs-workshop'
            # IconUri = ''
            # ReleaseNotes = ''
            # Prerelease = ''
        }
    }
}
