# Lab 06. Error Handling

- Open the file in your repo named `MyFunctions.ps1` in VSCode.

- In the function `Confirm-CourseID`, replace the output of the command with a non terminating error output

- In the function `GetUserData`, Add a `Try` block around the `Get-Content` command, with a catch block to create a breaking error
  - Change the value of `$MyUserListFile` to a non existing file and see that it handles the error
  - Change the `$ErrorActionPreference`, and see if the behavior changes. Valid values are:
    - SilentlyContinue
    - Stop
    - Continue
    - Inquire
    - Ignore
    - Suspend
    - Break
  - Use the `Get-Error` CmdLet to explore the error message and find the type of the error.
  - Change the catch block to be of the `ItemNotFoundException`, and add a specific 'DatabaseFile not found' message
  - Add another general 'Unknown error' catch block and output the error message

- Restore the path of the `$MyUserListFile` variable to `"$PSScriptRoot\MyLabFile.csv"`

# Expected outcome
 
An example of the outcome from these labs may be found in the file `MyFunctions.ps1` in this folder, in the `GetUserData` function.
