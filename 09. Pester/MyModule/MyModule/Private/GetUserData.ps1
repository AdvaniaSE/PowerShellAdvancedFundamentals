function GetUserData {
    $MyUserListFile = "$PSScriptRoot\..\MyLabFile.csv"

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