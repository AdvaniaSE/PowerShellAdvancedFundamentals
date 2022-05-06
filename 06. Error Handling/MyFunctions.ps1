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
    $MyUserListFile = "$PSScriptRoot\MyLabFile.csv"

    try {
        $MyUserList = Get-Content -Path $MyUserListFile -ErrorAction Stop | ConvertFrom-Csv
    }
    catch [System.Management.Automation.ItemNotFoundException] {
        Throw "Database not found: $MyUserListFile"
    }
    catch {
        Throw "Unknown error: $_"
    }

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
        $DatabaseFile = "$PSScriptRoot\MyLabFile.csv",

        [Parameter(Mandatory)]
        [ValidatePattern({'^[A-Z][\w\-\s]*$'}, ErrorMessage = 'Name is in an incorrect format')]
        [string]$Name,

        [Parameter(Mandatory)]
        [Int]$Age,

        [Parameter(Mandatory)]
        [ColorEnum]$Color,

        $UserID = (Get-Random -Minimum 10 -Maximum 100000)
    )
    
    $MyNewUser = [Participant]::new($Name, $Age, $Color, $UserId)
    $MyCsvUser = $MyNewUser.ToString() 
    
    $NewCSv = Get-Content $DatabaseFile -Raw
    $NewCSv += $MyCsvUser

    Set-Content -Value $NewCSv -Path $DatabaseFile
}

function Remove-CourseUser {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
    Param (
        $DatabaseFile = "$PSScriptRoot\MyLabFile.csv"
    )

    $MyUserList = Get-Content -Path $DatabaseFile | ConvertFrom-Csv
    $RemoveUser = $MyUserList | Out-GridView -PassThru
        
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
            Write-Error "User $($User.Name) has mismatching id: $($User.Id)"
        }
    }
}
