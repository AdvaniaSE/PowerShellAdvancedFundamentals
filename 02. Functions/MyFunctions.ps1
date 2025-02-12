
# Using code from the `GetUser.ps1` file Create a function named `GetUserData` that:
  # Gets the users in the `MyLabFiles.csv` file and returns them as an object

function GetUserData {
    $MyUserListFile = "$PSScriptRoot\MyLabFile.csv"
    $MyUserList = Get-Content -Path $MyUserListFile | ConvertFrom-Csv
    $MyUserList
}

# Using code from the `GetUser.ps1` file Create a function named `Get-CourseUser` that:
  # Returns all users in the `MyLabFiles.csv` using the `GetUserData` helper function.
  # If a name is given, returns only that specific user
  # Change your function into an Advanced function
     # Add one more parameter to the function called `OlderThan` with a default value of 65
     # Make sure the `OlderThan` parameter accepts only int types as input

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

# Using code from the `AddUser.ps1` file Create a function named `Add-CourseUser` that:
    # Has five parameters
        # DatabaseFile (Default value `$PSScriptRoot\MyLabFile.csv`)
        # Name (type [string], mandatory)
        # Age (type [int], mandatory)
        # Color (has a validateset 'red', 'green', 'blue', 'yellow', mandatory)
        # UserID (If none is given - generate one automatically)
    # Adds the given user to the database file

function Add-CourseUser {
    [CmdletBinding()]
    Param (
        $DatabaseFile = "$PSScriptRoot\MyLabFile.csv",

        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [Int]$Age,

        [Parameter(Mandatory)]
        [ValidateSet('red', 'green', 'blue', 'yellow')]
        [string]$Color,

        $UserID = (Get-Random -Minimum 10 -Maximum 100000)
    )
    
    $MyCsvUser = "$Name,$Age,{0},{1}" -f $Color, $UserId
    
    $NewCSv = Get-Content $DatabaseFile -Raw
    $NewCSv += $MyCsvUser

    Set-Content -Value $NewCSv -Path $DatabaseFile
}

# Using code from the `GetUser.ps1` file Create a function named `Remove-CourseUser` that:
    # Has parameter `DatabaseFile` with a default value of `$PSScriptRoot\MyLabFile.csv`
    # Using `SupportsShouldProcess` and `ConfirmImpact` Asks the user for confirmation, and based on the answer
        # Deletes the user
        # Outputs "Did nothing"

function Remove-CourseUser {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
    Param (
        $DatabaseFile = "$PSScriptRoot\MyLabFile.csv"
    )

    $MyUserList = Get-Content -Path $DatabaseFile | ConvertFrom-Csv
    $RemoveUser = $MyUserList | Out-ConsoleGridView -OutputMode Single
        
    if ($PSCmdlet.ShouldProcess([string]$RemoveUser.Name)) {
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
