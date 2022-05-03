# Lab 02. Functions

- Create a new file in your repo named `MyFunctions.ps1` where you store all functions from this lab.

- Using code from the `GetUser.ps1` file Create a function named `GetUserData` that:
  - Gets the users in the `MyLabFiles.csv` file and returns them as an object

- Using code from the `GetUser.ps1` file Create a function named `Get-CourseUser` that:
  - Returns all users in the `MyLabFiles.csv` using the `GetUserData` helper function.
  - If a name is given, returns only that specific user
  - Change your function into an Advanced function
    - Add one more parameter to the function called `OlderThan` with a default value of 65
    - Make sure the `OlderThan` parameter accepts only int types as input

- Using code from the `AddUser.ps1` file Create a function named `Add-CourseUser` that:
  - Has five parameters
    - DatabaseFile (Default value `$PSScriptRoot\MyLabFile.csv`)
    - Name (type [string], mandatory)
    - Age (type [int], mandatory)
    - Color (has a validateset 'red', 'green', 'blue', 'yellow', mandatory)
    - UserID (If none is given - generate one automatically)
  - Adds the given user to the database file

- Using code from the `GetUser.ps1` file Create a function named `Remove-CourseUser` that:
  - Has parameter `DatabaseFile` with a default value of `$PSScriptRoot\MyLabFile.csv`
  - Using `SupportsShouldProcess` and `ConfirmImpact` Asks the user for confirmation, and based on the answer
    - Deletes the user
    - Outputs "Did not remove user $($RemoveUser.Name)"
