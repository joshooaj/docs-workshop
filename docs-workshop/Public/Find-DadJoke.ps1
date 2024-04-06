function Find-DadJoke {
    [CmdletBinding()]
    [OutputType([string])]
    param (
        [Parameter()]
        [string]
        $Term = '',
        [Parameter()]
        [ValidateSet('json', 'text')]
        [string]
        $Format = 'json'
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
                $page = Invoke-RestMethod @irmParams -Verbose:$false
                Write-Verbose ("current_page = {0}; next_page = {1}; total_pages = {2}; total_jokes = {3}" -f $page.current_page, $page.next_page, $page.total_pages, $page.total_jokes)
                if ($page.results.Count -gt 0) {
                    $page.results
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
