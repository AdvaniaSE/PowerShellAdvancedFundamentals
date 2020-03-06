# Lab 07. Detailed - Debugging

## Debug in PowerShell

Test debugging using the provided script "TestScript.ps1" in a PowerShell console.

### Line

- Set a breakpoint on line 18
- Run the script
  - Examine the value of `$Result`
  - Use `v` or `stepOver` to run only the next command
  - Examine the value of `$Result` again
  - Use `c` or `continue` to let the script finish
- Remove the breakpoint

```PowerShell
# Set the breakpoint
Set-PSBreakpoint -Script '.\07. Debugging\TestScript.ps1' -Line 18

# Execute the script
& '.\07. Debugging\TestScript.ps1'

# Remove all breakpoints
Get-PSBreakpoint | Remove-PSBreakpoint
```

### Command

- Set a breakpoint on the command `Write-Output`
- Run the script
  - Use `l` or `list` to Verify that the script went into debug mode when calling `Write-Output`
  - Use `c` or `continue` to let the script finish
- Remove the breakpoint

```PowerShell
# Set the breakpoint
Set-PSBreakpoint -Script '.\07. Debugging\TestScript.ps1' -Command 'Write-Output'

# Execute the script
& '.\07. Debugging\TestScript.ps1'

# Remove all breakpoints
Get-PSBreakpoint | Remove-PSBreakpoint
```

### Variable

- Set a breakpoint on the variable `$Result`
- Run the script
  - Verify that the script went into debug mode when referring to `$Result`
  - Use the command to let the script finish
- Remove the breakpoint

```PowerShell
# Set the breakpoint
Set-PSBreakpoint -Script '.\07. Debugging\TestScript.ps1' -Variable 'Result'

# Execute the script
& '.\07. Debugging\TestScript.ps1'

# Remove all breakpoints
Get-PSBreakpoint | Remove-PSBreakpoint
```

*Tip:* There is a `Mode` parameter that lets you choose if the breakpoint should trigger when the variable is read, written to, or both.

### *Optional:* Action

- Set a new breakpoint with a condition to break using the `Action` parameter, base the condition on how many files were found in 'C:\Temp'
- Run the script
- Remove the breakpoint

```PowerShell
# Set the breakpoint
Set-PSBreakpoint -Script '.\07. Debugging\TestScript.ps1' -Line 21 -Action {
    # Action lets you set conditions for breaking
    # In this case if there are at least 3 files found when the script hits line 21
    if ($Result.Count -ge 3) {
        break
    }
}

# Execute the script
& '.\07. Debugging\TestScript.ps1'

# Remove all breakpoints
Get-PSBreakpoint | Remove-PSBreakpoint
```

---

## Debug in VS Code

Test debugging using the provided script "TestScript.ps1" in VS Code.

- Line
  - Set a breakpoint on line 18 by clicking to the left of the line, placing a red dot
  - Run the script
    - Add `$Result[0]` as an expression in the watch window, it should be null
    - Verify that the value of `$Result` is not showing up when hovering the mouse over it
    - Use the GUI buttons to step over the command
    - Examine the value of `$Result` by hovering the mouse over the value again
    - Click the continue button
  - Remove the breakpoint
- Hit Count
  - Set a breakpoint on line 21 and add a hit count condition of 2 to the breakpoint
    - Place a breakpoint on line 21, right click it and choose "Edit Breakpoint..."
    - Choose "Hit Count" and enter the number 2
  - Run the script
    - Verify that the current file in the iteration is not the first file in `$Result` by hovering the mouse over or looking at the Variables window in VS Code
    - Click the continue button
  - Remove the breakpoint
- *Optional:* Expression
  - Set a new breakpoint on line 21 and add a condition to break based on a specific file name amongst the files found
    - Find out the name of a file in the list found by the script
    - Place a breakpoint on line 21, right click it and choose "Edit Breakpoint..."
    - Choose "Expression" and write `$File -like '*<TheNameOfTheFile>*'`
  - Run the script
    - Verify that `$File` contains the file specified
  - Remove the breakpoint

---

## *More Reading*

```PowerShell
Get-Help about_Debuggers
```
