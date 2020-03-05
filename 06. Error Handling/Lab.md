# Lab 06. Error Handling

- Generate an error by running a command that doesn't exist in PowerShell
- Explore the error using `Get-Error`
- Create a try/catch block to capture the error and instead of an error, return the string `I captured the error: <ErrorMessage>`
- Using the information from `Get-Error`, specify the type of error in the catch block
- Change the type of error generated in the try block and add another catch block to catch the error
- Add a finally block outputting the string `Finally in the finally block.` and verify that this block is run no matter how the code flows.
- Change the `$ErrorActionPreference`, and see if the behavior changes.
