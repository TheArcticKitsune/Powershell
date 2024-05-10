#Url can be changed.
$url = 'https://api.github.com/users/hadley/orgs'
#Method can be set POST, Get.
$method = 'Get'
$headers = @{
    'Accept' = 'application/json'
    #'Authorization' = $env:
}
$body = @{
    'from' = '04/05/2024'
    'to' = '04/06/2024'
}
# This calls upon the Rest API
$response = Invoke-WebRequest -Uri $url -Method $method -Headers $headers -Body $body

#Write-Host "URL: $($respnes.BaseResponse.ResponseUri.AbsoluteUri)"
#Write-Host "ENCODING: $($response.ContentEncoding)"
#Write-Host "STATUS_CODE: $($response.StatusCode)"
#Write-Host "HEADERS: $($response.Headers)"
#Write-Host "TEXT: $($response.Content)"
#Write-Host "CONTENT: $($response.RawConent)"
#Write-Host "CSV: $($response.Content | ConvertTo-Csv)"
$jsonObj = ConvertFrom-Json $([String]::new($response.Content))
$jsonObj | Export-Csv -Path 'C:\Users\jaden\Desktop\test.csv'
#$response | Export-Csv -Path 'C:\Users\jaden\Desktop\test.csv'