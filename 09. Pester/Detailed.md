# Lab 09. Detailed - Pester

The solutions to this lab can be found in the `.\MyModule\Tests\MyModule.Tests.ps1` file.

Run the file using the command

```PowerShell
Invoke-Pester .\MyModule\Tests\ -Output Detailed
```

- *Optional:* Add a task to the `ModuleName.Build.ps1` that automatically runs all tests on build.

```PowerShell
## Add a variable pointing to where your pester tests are located
[string]$PesterPath = "$PSScriptRoot\Tests\"

## Add the task
Task Run_PesterTests {
    Invoke-Pester $PesterPath -Output Detailed
}

## Make sure it is run during build
task . Clean,
    Run_PesterTests,
    Build_Documentation,
    Compile_Module
```

---

## *More Reading*

```PowerShell
Get-Help about_Pester
```

- [Pester](https://pester.dev/)
- [Pester on GitHub](https://github.com/pester/Pester)
