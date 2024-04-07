class DadJoke {
    [string]$Id
    [string]$Joke
}

function Get-DadJoke {
    <#
    .SYNOPSIS
    Gets a dad joke from the icanhazdadjoke.com API.

    .DESCRIPTION
    Gets a dad joke from the icanhazdadjoke.com API.

    .PARAMETER JokeId
    Specifies an optional joke Id.

    .EXAMPLE
    Get-DadJoke

    Gets a dad joke, but can't help you "get" the dad joke.

    .NOTES

    .LINK
    https://icanhazdadjoke.com/api
    #>
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
            Uri         = $script:api.BaseUri
            Headers     = @{
                'Accept'     = $script:api.Format['json']
                'User-Agent' = $script:api.UserAgent
            }
            ErrorAction = 'Stop'
        }
        try {
            while ([datetime]::Now -lt $script:api.WaitUntil) {
                Write-Verbose 'Waiting a bit between requests. Be kind to free APIs <3'
                Start-Sleep -Milliseconds 500
            }
            [DadJoke](Invoke-RestMethod @irmParams | Select-Object Id, Joke)
            $script:api.WaitUntil = [datetime]::Now.Add($script:api.Interval)
        } catch {
            throw
        }
    }
}

function Find-DadJoke {
    [CmdletBinding()]
    [OutputType([DadJoke])]
    param (
        [Parameter()]
        [string]
        $Term = ''
    )

    process {
        $query = @{
            page  = 1
            limit = 20 # Max: 30
        }
        if (![string]::IsNullOrWhiteSpace($Term)) {
            $query.term = $Term
        }
        $irmParams = @{
            Headers     = @{
                'Accept'     = $script:api.Format['json']
                'User-Agent' = $script:api.UserAgent
            }
            ErrorAction = 'Stop'
        }
        do {
            try {
                $irmParams.Uri = buildUri -BaseUri $script:api.BaseUri -Path 'search' -Query $query
                while ([datetime]::Now -lt $script:api.WaitUntil) {
                    Write-Verbose 'Waiting a bit between requests. Be kind to free APIs <3'
                    Start-Sleep -Milliseconds 500
                }
                $page = Invoke-RestMethod @irmParams
                $script:api.WaitUntil = [datetime]::Now.Add($script:api.Interval)
                Write-Verbose ("current_page = {0}; next_page = {1}; total_pages = {2}; total_jokes = {3}" -f $page.current_page, $page.next_page, $page.total_pages, $page.total_jokes)
                if ($page.results.Count -gt 0) {
                    [DadJoke[]]$page.results
                }
            } catch {
                throw
            }
        } while ($page.next_page -eq (++$query.page))
    }
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

Export-ModuleMember -Function Get-DadJoke, Find-DadJoke -Alias Invoke-StevenJudd
