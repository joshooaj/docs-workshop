function Get-DadJoke {
    [CmdletBinding()]
    [Alias('Invoke-StevenJudd')]
    [OutputType([DadJoke])]
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
            while ([datetime]::Now -lt $script:api.WaitUntil) {
                Write-Verbose 'Waiting a bit between requests. Be kind to free APIs <3'
                Start-Sleep -Milliseconds 500
            }
            [DadJoke](Invoke-RestMethod @irmParams | Select-Object Id, Joke)
            $script:api.WaitUntil = [datetime]::Now.Add($script:api.Interval)
        } catch {
            Write-Error -ErrorRecord $_
            Write-Warning "Looks like maybe we couldn't reach $($script:api.BaseUri). Let's check the cache..."
            [DadJoke]($script:dadjokes | Get-Random | Select-Object Id, Joke)
        }
    }
}
