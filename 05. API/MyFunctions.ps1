enum ColorEnum {
    red
    green
    blue
    yellow
}

class Participant {
    [string] $Name
    [int] $Age
    [ColorEnum] $Color 
    [int] $Id

    Participant([String]$Name, [int]$Age, [ColorEnum]$Color, [int]$Id) {
        $This.Name = $Name
        $This.Age = $Age
        $This.Color = $Color
        $This.Id = $Id
    }

    [string] ToString() {
        Return '{0},{1},{2},{3}' -f $This.Name, $This.Age, $This.Color, $This.Id
    }
}

function GetUserData {
    $MyUserList = Invoke-RestMethod 'http://localhost:666/GetUser' | Select-Object -ExpandProperty result
    $MyUserList
}

function Get-CourseUser {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]$Name,
        
        [Parameter()]
        [int]$OlderThan
    )

    $Result = GetUserData

    if (-not [string]::IsNullOrEmpty($Name)) {
        $Result = $Result | Where-Object -Property Name -Like "*$Name*"
    }
    
    if ($OlderThan) {
        $Result = $Result | Where-Object -Property Age -ge $OlderThan
    }

    $Result
}

function Add-CourseUser {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [Int]$Age,

        [Parameter(Mandatory)]
        [ColorEnum]$Color,

        $UserID = (Get-Random -Minimum 10 -Maximum 100000)
    )
    

    Invoke-RestMethod 'http://localhost:666/AddUser' -Method Post -Body @{
        Name  = $Name
        Age   = $Age
        Color = $Color
    }

    # Alternate using query string
    # Invoke-RestMethod "http://localhost:666/AddUser?Name=$Name&Age=$Age&Color=$Color" -Method Get
}

function Remove-CourseUser {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
    Param (
        $DatabaseFile = "$PSScriptRoot\pode\MyLabFile.csv"
    )

    $MyUserList = Get-Content -Path $DatabaseFile | ConvertFrom-Csv
    $RemoveUser = $MyUserList | Out-ConsoleGridView -OutputMode Single
        
    if ($PSCmdlet.ShouldProcess($DatabaseFile)) {
        $MyUserList = $MyUserList | Where-Object {
            -not (
                $_.Name -eq $RemoveUser.Name -and
                $_.Age -eq $RemoveUser.Age -and
                $_.Color -eq $RemoveUser.Color -and
                $_.Id -eq $RemoveUser.Id
            )
        }
        Set-Content -Value $($MyUserList | ConvertTo-Csv -notypeInformation) -Path $MyUserListFile -WhatIf
    }
    else {
        Write-Output "Did not remove user $($RemoveUser.Name)"
    }
}

function Confirm-CourseID {
    Param()

    $AllUsers = GetUserData

    foreach ($User in $AllUsers) {
        if ($User.Id -notmatch '^\d+$') {
            Write-Output "User $($User.Name) has mismatching id: $($User.Id)"
        }
    }
}
