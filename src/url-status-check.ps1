param (
    [string]$url,
    [switch]$errorOnBadStatus
)

try {
    Write-Output "Querying $url"
    $response = Invoke-WebRequest -Method Get -Uri $url -UseBasicParsing -SkipCertificateCheck

    Write-Output "Status Code: $($response.StatusCode)"
    Write-Output "Content: $($response.Content)"

    echo "status_code=$($response.StatusCode)" >> $GITHUB_OUTPUT
    echo "content=$($response.Content)" >> $GITHUB_OUTPUT

    if ($errorOnBadStatus -and $response.StatusCode -ge 400) {
        throw "The status code $($response.StatusCode) indicates either a problem with the request or the application running at $url."
    }
}
catch {
    Write-Output "Querying $url failed!"
    Write-Output $_.Exception
    throw
}