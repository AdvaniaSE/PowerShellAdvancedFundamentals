# Lab 07. Debugging

## Debug in PowerShell

Test debugging using the provided script "DebuggingScript.ps1" in a PowerShell console.

### Line

- Set a breakpoint on line 18
- Run the script
  - Examine the value of `$Result`
  - Step over only the next command
  - Examine the value of `$Result` again
  - Use the command to let the script finish
- Remove the breakpoint

### Command

- Set a breakpoint on the command `Write-Output`
- Run the script
  - Use a command to verify that the script went into debug mode when calling `Write-Output` by finding out the current line
  - Use the command to let the script finish
- Remove the breakpoint

### Variable

- Set a breakpoint on the variable `$Result`
- Run the script
  - Verify that the script went into debug mode when referring to `$Result`
  - Use the command to let the script finish
- Remove the breakpoint

### *Optional:* Action

- Set a new breakpoint with a condition to break using the `Action` parameter, base the condition on how many files were found in 'C:\Temp'
- Run the script
- Remove the breakpoint

---

## Debug in VS Code

Test debugging using the provided script "DebuggingScript.ps1" in VS Code.

### Breakpoint

- Set a breakpoint on line 18
- Run the script
  - Add `$Result[0]` as an expression in the watch window, it should be null
  - Examine the value of `$Result` by hovering the mouse over it
  - Step over only the next command
  - Examine the value of `$Result` again and note that the watch window has been updated
  - Click continue
- Remove the breakpoint

### Hit Count

- Set a breakpoint on line 21 and add a hit count condition of 2 to the breakpoint
- Run the script
  - Verify that the current file in the iteration is not the first file in `$Result`
    - Click continue
  - Remove the breakpoint

### *Optional:* Expression

- Set a new breakpoint on line 21 and add a condition to break based on a specific file name amongst the files found
  - Find out the name of a file in the list found by the script
  - Place a breakpoint on line 21, right click it and choose "Edit Breakpoint..."
  - Write an expression that evaluates to true when that file is in the current loop iteration in the script
- Run the script
  - Verify that the expression triggered the breakpoint correctly
- Remove the breakpoint
