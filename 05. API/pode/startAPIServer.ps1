if (-not (Get-Module Pode -ListAvailable)) {
    Find-Module Pode | Install-Module
}

Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 666 -Protocol Http

    Add-PodeRoute -Method Get -Path '/GetUser' -ScriptBlock {

        if (-not ([string]::IsNullOrEmpty($WebEvent.Query['Name']))) {
            [string]$Name = $WebEvent.Query['Name']
            $res = . $PSScriptRoot\MyApi.ps1 -Name $Name
        }
        elseif (-not ([string]::IsNullOrEmpty($WebEvent.Query['Age']))) {
            [int]$Age = $WebEvent.Query['Age']
            $res = . $PSScriptRoot\MyApi.ps1 -Age $Age
        }
        elseif (-not ([string]::IsNullOrEmpty($WebEvent.Query['Color']))) {
            [string]$Color = $WebEvent.Query['Color']
            $res = . $PSScriptRoot\MyApi.ps1 -Color $Color
        }
        else {
            $res = . $PSScriptRoot\MyApi.ps1
        }
        
        Write-PodeJsonResponse -Value @{
            result = $res
        }
    }

    
    Add-PodeRoute -Method Get -Path '/AddUser' -ScriptBlock {

        if ([string]::IsNullOrEmpty($WebEvent.Query['Name'])) {
            Write-PodeJsonResponse -Value @{
                result = 'Missing parameter Name'
            } -StatusCode 400
        }
        elseif ([string]::IsNullOrEmpty($WebEvent.Query['Age'])) {
            Write-PodeJsonResponse -Value @{
                result = 'Missing parameter Age'
            } -StatusCode 400
        }
        elseif ([string]::IsNullOrEmpty($WebEvent.Query['Color'])) {
            Write-PodeJsonResponse -Value @{
                result = 'Missing parameter Color'
            } -StatusCode 400
        }
        else {
            & $PSScriptRoot\MyApiSet.ps1 -Name $($WebEvent.Query['Name']) -Age $($WebEvent.Query['Age']) -Color $($WebEvent.Query['Color'])
            Write-PodeJsonResponse -Value @{
                result = $res
            }
            
        }
    }
}