function Get-DadJoke {
    [CmdletBinding()]
    [Alias('Invoke-StevenJudd')]
    [OutputType([string])]
    param (
        [Parameter()]
        [Alias('Id')]
        [string]
        $JokeId
    )

    process {
        $irmParams = @{
            Uri = $script:api.BaseUri
            Headers = @{
                'Accept'     = $script:api.Format['json']
                'User-Agent' = $script:api.UserAgent
            }
        }
        try {
            Invoke-RestMethod @irmParams
        } catch {
            Write-Error -ErrorRecord $_
            Write-Warning "Looks like maybe we couldn't reach $($script:api.BaseUri). Let's check the cache..."
            $script:dadjokes | Get-Random
        }
    }
}
