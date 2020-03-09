# Lab 06. Detailed - Error Handling

---

*Note:* Depending on how you generate and observe the errors in this lab, the solution will look different. Please explore and try more than one way of solving this.

Some commands do not by default generate breaking errors, so we force them to do so with the `-ErrorAction Stop` parameter.

---

- Generate an error by running a command that doesn't exist in PowerShell

```PowerShell
Get-Error $ThisVariableDoesNotExist
```

---

- Change the `$ErrorView` variable and note the difference between messages. Valid values for ErrorView are
  - NormalView
  - CategoryView
  - ConciseView (This is the default view)

```PowerShell
$ErrorView = 'CategoryView'
```

---

- Explore the error using `Get-Error`

The powershell `$Error` Variable is an ArrayList that contains all errors since the console started, where index 0 is the most rescent error.

```PowerShell
Get-Error $Error[0]
```

---

- Create a try/catch block to capture the error and instead of an error, return the string "I captured the error: \<ErrorMessage\>"

The error generated here will still be in the `$Error` variable, and you can still explore it using `Get-Error`, But because we caught it we can instead handle it gracefully.

```PowerShell
try {
    Get-Error $ThisVariableDoesNotExist
}
catch {
    Write-Output "I captured the error: $($_.Exception.Message)"
}
```

---

- Using the information from `Get-Error`, specify the type of error in the catch block

The output from `Get-Error` contains everything PowerShell knows about the thrown error. One of the lines in the output is `Type`, which we can use to catch specific errors.

An error object can contain several type of errors, as errors are nested in a so-called stack trace from the original point of failure.

```PowerShell
try {
    Get-Error $ThisVariableDoesNotExist -ErrorAction Stop
}
catch [System.Management.Automation.ValidationMetadataException] {
    Write-Output 'I captured the named error.'
}
```

---

- Change the type of error generated in the try block and add another catch block to catch the error

```PowerShell
try {
    Get-Item C:\ThisPathDoesNotExist\ -ErrorAction Stop
}
catch [System.Management.Automation.ValidationMetadataException] {
    Write-Output "I captured the metadata error."
}
catch {
    Write-Output 'This exception is not specified'
}
```

---

- Add a finally block outputting the string "Finally in the finally block." and verify that this block is run no matter how the code flows.

```PowerShell
# First, lets try the last command we run
try {
    Get-Item C:\ThisPathDoesNotExist\ -ErrorAction Stop
}
catch [System.Management.Automation.ValidationMetadataException] {
    Write-Output "I captured the metadata error."
}
catch {
    Write-Output 'This exception is not specified'
}
finally {
    Write-Output 'Finally in the finally block.'
}

# Second, Lets try the named exception
try {
    Get-Error $ThisVariableDoesNotExist -ErrorAction Stop
}
catch [System.Management.Automation.ValidationMetadataException] {
    Write-Output "I captured the metadata error."
}
catch {
    Write-Output 'This exception is not specified'
}
finally {
    Write-Output 'Finally in the finally block.'
}

# Last, lets try a working command
try {
    Get-Process pwsh
}
catch [System.Management.Automation.ValidationMetadataException] {
    Write-Output "I captured the metadata error."
}
catch {
    Write-Output 'This exception is not specified'
}
finally {
    Write-Output 'Finally in the finally block.'
}

```

---

- Change the `$ErrorActionPreference`, and see if the behavior changes. Valid values are:
  - SilentlyContinue
  - Stop
  - Continue
  - Inquire
  - Ignore
  - Suspend
  - Break
  
To re-run the same script we can start by creating a function that will break.

```PowerShell
Function Get-ItemThatDoesNotExist {
    try {
        Get-Item C:\ThisPathDoesNotExist\
    }
    catch {
        Write-Output 'We caught the exception'
    }
}
```

Now we can run the function in PowerShell, change the `$ErrorActionPreference` and try it!

```PowerShell
# This should throw an error
Get-ItemThatDoesNotExist

$ErrorActionPreference = 'Stop'
# This should now say 'We caught the exception'
Get-ItemThatDoesNotExist

$ErrorActionPreference = 'Break'
# This will break in to the debugger. Press Q to exit.
Get-ItemThatDoesNotExist
```

---

## *More Reading*

```PowerShell
Get-Help about_Try_Catch_Finally
```
