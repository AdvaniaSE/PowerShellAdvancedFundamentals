# Lab 05. API

This lab requires the PowerShell module `Pode`. If you do not have this module installed it can be installed in multiple ways:

Through the PowerShell Gallery

```PowerShell
Find-Module Pode | Install-Module
```

Or from the GitHub page [here.](https://github.com/Badgerati/Pode/releases/)

## Starting the Pode API

In the folder `pode` there are five files:
- MyApi.ps1 - This file contains the code for the `GetUser` endpoint
- MyApiSet.ps1 - This file contains the code for the `AddUser` endpoint
- MyLabFile.csv - The use database. PLease not that this version of the user database will be altered during the lab.
- StartAPIServer.ps1 - This file contains Pode configuration to start the API.
- CallPodeAPI.ps1 - This file contains examples of how to call the API.

1. Open up a new PowerShell terminal window.
2. Navigate to the [pode folder](./pode/)
3. Start Pode by running  `.\startAPIServer.ps1`

> NOTE: Pode will reserve this window when run, so no code can be executed in this session during the demo. Use VSCode or another terminal to call the API.

The Pode API Can be reached through the address `http://localhost:666/<Endpoint Name>`. Available endpoints are

1. GetUser - `http://localhost:666/GetUser` - Gets a user using optional query strings for search - `http://localhost:666/GetUser?Color=Red`
2. AddUser - `http://localhost:666/AddUser`- Creates a new user. Input from query string - `http://localhost:666/AddUser?Name=James Brown&Age=73&Color=Brown` - or post JSON body

## Get user data

- Open the file in your repo named `MyFunctions.ps1` in VSCode.

- Change the function `GetUserData` to use the Pode endpoint `GetUser` to search for users. Verify that `Get-CourseUser` and `Confirm-CourseID` still works as expected when using API input.

GetUserData is an internal function and as such can be changed without user issues, as long as external functions are not affected.
Since the API outputs a `result` member we need to expand this in order to prevent the need to re-write the external functions.

```PowerShell
function GetUserData {
    $MyUserList = Invoke-RestMethod 'http://localhost:666/GetUser' | Select-Object -ExpandProperty result
    $MyUserList
}
```

## Create new users

- Change the function `Add-CourseUser` to use the Pode endpoint `AddUser` to create new users. Verify new users are created correctly by checking the `MyLabFile.csv` in the `pode` folder.

> Note:
> There are two parameter changes that would make sense to alter in this function when moving to API.
> 
> - Remove the parameter input for `$DatabaseFile`
> - Remove the parameter validation for `$Name` to prevent regex issues
> 
> However - Remember - Removing a parameter can cause end user scripts to fail! In some cases it may be better to keep the parameter and not use it.

```PowerShell
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
```

# Expected outcome
 
An example of the outcome from these labs may be found in the file `MyFunctions.ps1` in this folder, in the `GetUserData` and `Add-CourseUser` functions.
