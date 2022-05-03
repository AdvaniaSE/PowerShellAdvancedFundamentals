# Lab 06. Detailed - Error Handling

- Open the file in your repo named `MyFunctions.ps1` in VSCode.

- In the function `Confirm-CourseID`, replace the output of the command with a non terminating error output

```PowerShell
Write-Error "User $($User.Name) has mismatching id: $($User.Id)"
```

- In the function `GetUserData`, Add a `Try` block around the `Get-Content` command, with a catch block to create a breaking error
  - Change the value of `$MyUserListFile` to a non existing file and see that it handles the error

```PowerShell
###
function GetUserData {
    $MyUserListFile = "NotAFile.txt"

    try {
        $MyUserList = Get-Content -Path $MyUserListFile | ConvertFrom-Csv
    }
    catch {
        Throw $_
    }
    
    $MyUserList
}
###

GetUserData
```

- Change the `$ErrorActionPreference`, and see if the behavior changes. Valid values are:
  - SilentlyContinue
  - Stop
  - Continue
  - Inquire
  - Ignore
  - Suspend
  - Break

- Use the `Get-Error` CmdLet to explore the error message and find the type of the error.
- Change the catch block to be of the `ItemNotFoudException`, and add a specific 'DatabaseFile not found' message
- Add another general 'Unknown error' catch block and output the error message

```PowerShell
function GetUserData {
    $MyUserListFile = "NotAFile.txt"

    try {
        $MyUserList = Get-Content -Path $MyUserListFile -ErrorAction Stop| ConvertFrom-Csv
    }
    catch [System.Management.Automation.ItemNotFoundException] {
        Throw "Database not found: $MyUserListFile"
    }
    catch {
        Throw "Unknown error: $_"
    }

    $MyUserList
}
```

- Restore the path of the `$MuUserListFile` variable to `"$PSScriptRoot\MyLabFile.csv"`

---

The resulting `MyFunctions.ps1` file can be found in this folder.

---

## *More Reading*

```PowerShell
Get-Help about_Try_Catch_Finally
```
