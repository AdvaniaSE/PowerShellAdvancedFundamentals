<#
.SYNOPSIS
    This function gets a course user
.DESCRIPTION
    This function gets a course user. It can filter on name or how old the user is.
.NOTES
    We require a specific datastructure foun in our user database for this to work.
.LINK
    www.our-intranet.com
.EXAMPLE
    > Get-CourseUser -Name 'Björn'
    This command will return all users matching the name 'Björn'
#>

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

