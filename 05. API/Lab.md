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

## Create new users

- Change the function `Add-CourseUser` to use the Pode endpoint `AddUser` to create new users. Verify new users are created correctly by checking the `MyLabFile.csv` in the `pode` folder.

# Expected outcome
 
An example of the outcome from these labs may be found in the file `MyFunctions.ps1` in this folder, in the `GetUserData` and `Add-CourseUser` functions.
