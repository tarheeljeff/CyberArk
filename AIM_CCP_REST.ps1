function Get-AIMPassword ([string]$PVWA_URL, [string]$AppID, [string]$Safe, [string]$ObjectName) {
 
    # Declaration
    $fetchAIMPassword = "${PVWA_URL}/AIMWebService/api/Accounts?AppID=${AppID}&Safe=${Safe}&Folder=Root&Object=${ObjectName}"
 
    # Execution
    try {
        $response = Invoke-RestMethod -Uri $fetchAIMPassword -Method GET -ContentType "application/json" -ErrorVariable aimResultErr
        Return $response.content
    }
    catch {
        Write-Host "StatusCode: " $_.Exception.Response.StatusCode.value__
        Write-Host "StatusDescription: " $_.Exception.Response.StatusDescription
        Write-Host "Response: " $_.Exception.Message
        Return $false
    }
}
​
$password = Get-AIMPassword -PVWA_URL "https://SUSILCEISPASC32" -AppID "Tenable" -Safe "Tenable" -ObjectName "Operating System-StoneXTenableAccounts-FCStone-SA-CA-Nessus_WP"
​
Write-Host "Your password is: ${password}" 
Start-Sleep -s 10
