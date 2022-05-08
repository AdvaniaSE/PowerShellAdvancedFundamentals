# Lab 08. Detailed - Building Modules
# Lab 08. Building Modules

In the folder `MyModule` we have set up a standard folder structure of a module.

- Split the _functions_ of the `MyFunctions.ps1` file in to one file per function, named the same as the function, and store them in the following folders:
  - Public:
    - Get-CourseUser
    - Add-CourseUser
    - Remove-CourseUser
    - Confirm-CourseID
  - Private:
    - GetUserData
- Copy both the _Classes_ and _enums_ of the `MyFunctions.ps1` file in to one file named `Classes.ps1` in to the `Classes` folder

- Copy the `MyLabFile.csv` in to the `MyModule\MyModule\` folder
  - Update the `GetUserData`, `Add-CourseUser`, and `Remove-CourseUser` functions to point to the new `MyLabFile.csv` data file.

  ```PowerShell
  "$PSScriptRoot\..\MyLabFile.csv"
  ```

---

- Create a `.psm1` module file in the `MyModule\MyModule` folder
  - Make sure the module:
    - Imports all functions from the `Classes` folder
    - Imports all functions from the `Private` folder
    - Imports all functions from the `Public` folder

  ```PowerShell
  # Add this to your psm1 file.

  # import classes
  foreach ($file in (Get-ChildItem "$PSScriptRoot\Classes\*.ps1"))
  {
    try {
      Write-Verbose "Importing $($file.FullName)"
      . $file.FullName
    }
    catch {
      Write-Error "Failed to import '$($file.FullName)'. $_"
    }
  }

  # import private functions
  foreach ($file in (Get-ChildItem "$PSScriptRoot\Private\*.ps1"))
  {
    try {
      Write-Verbose "Importing $($file.FullName)"
      . $file.FullName
    }
    catch {
      Write-Error "Failed to import '$($file.FullName)'. $_"
    }
  }

  # import public functions
  foreach ($file in (Get-ChildItem "$PSScriptRoot\Public\*.ps1"))
  {
    try {
      Write-Verbose "Importing $($file.FullName)"
      . $file.FullName
    }
    catch {
      Write-Error "Failed to import '$($file.FullName)'. $_"
    }
  }
  ```

- Import the module, and check its details using `Get-Module`
  
```PowerShell
Import-Module .\MyModule\MyModule\MyModule.psm1
Get-Module MyModule | Format-List
```

- Check which commands you get from the module

```PowerShell
Get-Command -Module MyModule
```

- Remove the module from the active session
  
```PowerShell
Remove-Module MyModule
```

---

- Create a module manifest for the module.

  ```PowerShell
  New-ModuleManifest -Path .\MyModule\MyModule\MyModule.psd1
  ```

  - Verify you can import the module, and check its details using `Get-Module`

  ```PowerShell
  Import-Module .\MyModule\MyModule\
  Get-Module MyModule | Format-List
  ```

  - Check which commands you get from the module

  ```PowerShell
  Get-Command -Module MyModule
  # By default a manifest does not export any functions
  ```

  - Remove the module from the active session

  ```PowerShell
  Remove-Module MyModule
  ```

  - Edit the manifest to
    - Export the functions in the `Public` folder

    ```PowerShell
    # First we need to make sure our manifest points to our module file
    RootModule = 'MyModule.psm1'

    # Later in the manifest file we add the exported commands
    FunctionsToExport = @(
        'Add-CourseUser',
        'Confirm-CourseID',
        'Get-CourseUser',
        'Remove-CourseUser'
    )
    ```
  
    - Have a better module version

    ```PowerShell
    ModuleVersion = '1.0.0'
    ```

    - Set the correct copyright data

    ```PowerShell
    # Author of this module
    Author = 'Björn Sundling'

    # Company or vendor of this module
    CompanyName = 'Advania'

    # Copyright statement for this module
    Copyright = '(c) Björn Sundling. All rights reserved.'
    ```
  
  - Import the module again, and verify:
    - The new module settings

    ```PowerShell
    Import-Module .\MyModule\MyModule\
    Get-Module MyModule | Format-List
    ```

    - That you only get the commands you want to export

    ```PowerShell
    Get-Command -Module MyModule
    ```

---

- Import the module and read the help documentation for the `Get-CourseUser` function

```PowerShell
Import-Module .\MyModule\MyModule\
Get-Help Get-CourseUser
```

- Add comment based help to the `Get-CourseUser` command
  - Open the file `Get-CourseUser.ps1` in vscode
  - On the first line of the file, press `Ctrl+Space` to trigger the intellisense menu
  - select `Comment-help` to get the default help text
  - Fill in some data in the different sections

  ```PowerShell
  <#
  .SYNOPSIS
      This function gets a course user
  .DESCRIPTION
      This function gets a course user. It can filter on name or how old the user is.
  .NOTES
      We require a specific datastructure foun in our user database for this to work.
  .LINK
      www.our-intranet.com
  .EXAMPLE
      > Get-CourseUser -Name 'Björn'
      This command will return all users matching the name 'Björn'
  #>
  ```

- Import the module again and verify the help documentation is updated

```PowerShell
Import-Module .\MyModule\MyModule\
Get-Help Get-CourseUser
```

---

## Extra lab - Documentation

- Use the `PlatyPS` module to export and create markdown based help in the `MyModule\Documentation` folder

```PowerShell
New-MarkdownHelp -Module MyModule -OutputFolder .\MyModule\Documentation\
```

## Extra lab - Build Script

- Use the `InvokeBuild` module to create a build script that:
  - Compiles the module in to one psm1/psd1 file
  - Compiles the markdown help documentation and includes it
  - Outputs the resulting module to a bin folder
    - If there already is a bin folder, remove it.

```PowerShell
# One example of a build script.
#Requires -Modules 'InvokeBuild', 'PlatyPS'

[string]$ModuleName = 'MyModule'
[string]$ModuleSourcePath = "$PSScriptRoot\MyModule"
[string]$HelpSourcePath = "$PSScriptRoot\Documentation"

[string]$Version = '1.0.0'

[string]$OutputPath = "$PSScriptRoot\Bin\$ModuleName\$Version"

task Clean {
    If (Test-Path -Path $OutputPath) {
        "Removing existing files and folders in $OutputPath"
        Get-ChildItem $OutputPath | Remove-Item -Force -Recurse
    }
    Else {
        "$OutputPath is not present, nothing to clean up."
        $Null = New-Item -ItemType Directory -Path $OutputPath
    }
}

Task Build_Documentation {
    New-ExternalHelp -Path $HelpSourcePath -OutputPath "$OutputPath\en-US"
}

task Compile_Module {
    $PSM1Name = "$ModuleName.psm1"
    New-Item -Name $PSM1Name -Path $OutputPath -ItemType File -Force 
    $PSM1Path = (Join-Path -Path $OutputPath -ChildPath $PSM1Name)
    
    $PSD1Name = "$ModuleName.psd1"
    New-Item -Name $PSD1Name -Path $OutputPath -ItemType File -Force 
    $PSD1Path = (Join-Path -Path $OutputPath -ChildPath $PSD1Name)

    $ExportedFunctionList = [System.Collections.Generic.List[string]]::new()

    # Classes
    Get-ChildItem "$ModuleSourcePath\Classes" *.ps1 | ForEach-Object {
        $FileContent = Get-Content $_.FullName
        "#region $($_.BaseName)`n"      | Out-File $PSM1Path -Append
        $FileContent                    | Out-File $PSM1Path -Append
        "#endregion $($_.BaseName)`n"   | Out-File $PSM1Path -Append
    }

    # Private functions
    Get-ChildItem "$ModuleSourcePath\Private" *.ps1 | ForEach-Object {
        $FileContent = Get-Content $_.FullName
        "#region $($_.BaseName)`n"      | Out-File $PSM1Path -Append
        $FileContent                    | Out-File $PSM1Path -Append
        "#endregion $($_.BaseName)`n"   | Out-File $PSM1Path -Append
    }

    # Public functions
    Get-ChildItem "$ModuleSourcePath\Public" *.ps1 | ForEach-Object {
        $ExportedFunctionList.Add($_.BaseName)

        $FileContent = Get-Content $_.FullName
        "#region $($_.BaseName)`n" | Out-File $PSM1Path -Append
        $FileContent | Out-File $PSM1Path -Append
        "#endregion $($_.BaseName)`n" | Out-File $PSM1Path -Append
    }

    # Manifest
    $ManifestContent = (Get-Content "$ModuleSourcePath\$ModuleName.psd1" ) -replace 'ModuleVersion\s*=\s*[''"][0-9\.]{1,10}[''"]',"Moduleversion = '$Version'" -replace 'FunctionsToExport\s*=\s*[''"]\*[''"]',"FunctionsToExport = @('$($ExportedFunctionList -join "','")')"
    $ManifestContent | Out-File $PSD1Path 
}

Get-Module -Name $ModuleName | Remove-Module -Force
# Default task :
task . Clean,
    Build_Documentation,
    Compile_Module

```

---

## *More Reading*

```PowerShell
Get-Help about_Modules
```

- [PlatyPS](https://github.com/PowerShell/platyPS)
- [InvokeBuild](https://github.com/nightroman/Invoke-Build)
