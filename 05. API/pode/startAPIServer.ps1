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

    Add-PodeRoute -Method Get, Post -Path '/AddUser' -ScriptBlock {
        if ($WebEvent.Method -eq 'get') {
            $query = $WebEvent.Query

            $name = $query['Name']
            $age = $query['Age']
            $color = $query['Color']
        }
        elseif ($WebEvent.Method -eq 'post') {
            $body = $WebEvent.Data

            $name = $body['Name']
            $age = $body['Age']
            $color = $body['Color']
        }

        'name', 'age', 'color' | Foreach-Object {
            if ([string]::IsNullOrEmpty($((Get-Variable $_).Value))) {
                Write-PodeJsonResponse -Value @{
                    result = "Missing parameter $_"
                } -StatusCode 400
                $failed = $true
            }
        }
        
        if (-not $failed) {
            $res = & $PSScriptRoot\MyApiSet.ps1 -Name $name -Age $age -Color $color
            Write-PodeJsonResponse -Value @{
                result = $res
            }    
        }
    }
}