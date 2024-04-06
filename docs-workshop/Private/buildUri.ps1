function buildUri {
    [CmdletBinding()]
    [OutputType([uri])]
    param (
        [Parameter(Mandatory, Position = 0)]
        [string]
        $BaseUri,

        [Parameter()]
        [string]
        $Path,

        [Parameter()]
        [hashtable]
        $Query
    )

    process {
        $uriBuilder = [uribuilder]$BaseUri
        if (![string]::IsNullOrWhiteSpace($Path)) {
            $uriBuilder.Path = $Path
        }
        $nameValueCollection = [Web.HttpUtility]::ParseQueryString('')
        $Query.GetEnumerator() | ForEach-Object {
            $nameValueCollection.Add($_.Key, $_.Value)
        }
        $uriBuilder.Query = $nameValueCollection.ToString()
        $uriBuilder.Uri
    }
}
