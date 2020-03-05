# Lab 06. Error Handling

- Generate an error by running a command that doesn't exist in PowerShell

- Explore the error using the Get-Error CmdLet

- Create a Try/Catch block to capture the error and instead of an error, return a string 

`I captured the error: <ErrorMessage>`

- Using the information from Get-Error, specify the type of error in the catch block

- Change the command in the try block, and use multiple catch blocks

- Add a finally block outputting a string `Finally, im doing this.`, and verify that this block is run no matter how the code flows.

- Change ErrorActionPreference, and see if the behaviour changes.
