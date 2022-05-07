# Lab 07. Detailed - Debugging

In this folder we have added another function based on contents of the `GetUser.ps1`

Use the `UpdateYear.ps1` file to try out different ways of debugging.

---

- Debug in the shell
  - Line
    - Set a breakpoint on line `16`of the `UpdateYear.ps1` script and run it.

    ```PowerShell
    Set-PSBreakpoint -Script .\UpdateYear.ps1 -Line 16
    ```
  
    - Verify you are in a debug session by checking the prompt message. Debug sessions always contain the text `[DBG]`
    - Find all available commands by typing `?` in the console.

    ```PowerShell
    s, stepInto         Single step (step into functions, scripts, etc.)
    v, stepOver         Step to next statement (step over functions, scripts, etc.)
    o, stepOut          Step out of the current function, script, etc.

    c, continue         Continue operation
    q, quit             Stop operation and exit the debugger
    d, detach           Continue operation and detach the debugger.

    k, Get-PSCallStack Display call stack

    l, list             List source code for the current script.
                        Use "list" to start from the current line, "list <m>"
                        to start from line <m>, and "list <m> <n>" to list <n>
                        lines starting from line <m>

    <enter>             Repeat last command if it was stepInto, stepOver or list

    ?, h                displays this help message.
    ```

    - Test the behaviour and output of the `Step Into`, `Step Over`, and `Step Out` functions
    - Verify the value of the `$User` Variable and see that it updates

    ```PowerShell
    # Debug mode is still normal powershell. Outputing a variable is done by typing it
    $User
    ```
  
    - Type `c` to continue running the script, hitting the breakpoint again, or `q` to break the script right away.
    - Remove the breakpoint

    ```PowerShell
    Get-PSBreakpoint | Remove-PSBreakpoint
    ```

  - Command
    - Create a breakpoint the triggers on the `Set-Content` command _and_ When hitting the breakpoint outputs the $MyUserList variable in csv format

    ```PowerShell
    Set-PSBreakpoint -Command Set-Content -Action {Write-host $($MyUserList | ConvertTo-CSV)}
    ```
  
    - Verify the output, and remove the breakpoint

    ```PowerShell
    Get-PSBreakpoint | Remove-PSBreakpoint
    ```
  
  - Variable
    - Set a breakpoint on the `User` variable, triggered only when written

    ```PowerShell
    Set-PSBreakpoint -Variable 'User' -Script .\UpdateYear.ps1 -Mode Write
    ```
  
    - Verify the breakpoint only gets hit once for every user in the user list.

    - Remove the breakpoint, and set a new one triggered upon both read and write operations

    ```PowerShell
    Get-PSBreakpoint | Remove-PSBreakpoint
    Set-PSBreakpoint -Variable 'User' -Script .\UpdateYear.ps1 -Mode ReadWrite
    ```

    - Verify the breakpoint is now hit a number of times for each iteration

---

## *More Reading*

```PowerShell
Get-Help about_Debuggers
```
