param (
    [string]$url,
    [switch]$errorOnBadStatus
)

try {
    Write-Output "Querying $url"
    $response = Invoke-WebRequest -Method Get -Uri $url -UseBasicParsing -SkipCertificateCheck

    Write-Output "Status Code: $($response.StatusCode)"
    Write-Output "Content: $($response.Content)"

    "status_code=$($response.StatusCode)" >> $env:GITHUB_OUTPUT
    "content=$($response.Content)" >> $env:GITHUB_OUTPUT

    if ($errorOnBadStatus -and $response.StatusCode -ge 400) {
        throw "The status code $($response.StatusCode) indicates either a problem with the request or the application running at $url."
    }
}
catch {
    Write-Output "Querying $url failed!"
    Write-Output $_.Exception
    throw
}