# Dot source public/private functions when importing from source.
# When module is "built" all functions are copied into the PSM1 and exported functions are declared in the manifest.
if (Test-Path -Path $PSScriptRoot/Public) {
    [io.fileinfo[]]$enums   = @(, (Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Enums/*.ps1')   -Recurse -ErrorAction SilentlyContinue)) | Select-Object
    [io.fileinfo[]]$classes = @(, (Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Classes/*.ps1') -Recurse -ErrorAction SilentlyContinue)) | Select-Object
    [io.fileinfo[]]$private = @(, (Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Private/*.ps1') -Recurse -ErrorAction SilentlyContinue)) | Select-Object
    [io.fileinfo[]]$public  = @(, (Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Public/*.ps1')  -Recurse -ErrorAction SilentlyContinue)) | Select-Object
    foreach ($import in ($enums + $classes + $private + $public)) {
        try {
            . $import.FullName
        } catch {
            throw
        }
    }
    Export-ModuleMember -Function $public.Basename -Alias Invoke-StevenJudd
}

$script:api = @{
    BaseUri   = 'https://icanhazdadjoke.com/'
    UserAgent = 'PSHSummit docs-workshop (https://github.com/joshooaj/)'
    Format = @{
        json = 'application/json'
        text = 'text/plain'
        html = 'text/html'
    }
    WaitUntil = [datetime]::MinValue
    Interval  = [timespan]::FromSeconds(1)
}

$script:dadjokes = [io.file]::ReadAllText((Resolve-Path $PSScriptRoot/cache/dadjokes.json)) | ConvertFrom-Json
