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
            Headers = @{
                'Accept'     = $script:api.Format['json']
                'User-Agent' = $script:api.UserAgent
            }
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
                Write-Error -ErrorRecord $_
                Write-Warning "Looks like maybe we couldn't reach $($script:api.BaseUri). Let's check the cache..."
                $Term = "*$Term*"
                $script:dadjokes | Where-Object joke -like $Term
            }
        } while ($page.next_page -eq (++$query.page))
    }
}
