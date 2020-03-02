# Write a PowerShell Module using Plaster

## Preparation

Install the following modules:

- [Install-Module Plaster](https://github.com/PowerShell/Plaster)
- [Install-Module InvokeBuild](https://github.com/nightroman/Invoke-Build)
- [Install-Module PowerShellGet](https://docs.microsoft.com/en-us/powershell/module/powershellget)
- [Install-Module ModuleBuilder](https://github.com/PoshCode/ModuleBuilder)
- [Install-Module Pester](https://github.com/pester/Pester)

Download the [gyPSum](https://github.com/SimonWahlin/gyPSum) template.

Run "`Invoke-Plaster -TemplatePath .\gyPSum\Module -DestinationPath .`"

Create module `"PSAddOne"`.

## Functionality

### Private Function
In the "Private" folder, create a script with a normal "helper" function called `"Add-OneToValue"` that takes an int as input, adds 1 to it and outputs the new number.

### Public Function
In the "Public" folder, create a script with an advanced function called `"Add-OneToString"` that takes a string as input and validates that it matches "ccccn" where c is a letter and n is a number. The function should split the string to get the number, add to it using the private function `"Add-OneToValue"` and output the string with the new number instead.

Example:

`Add-OneToString "abcd6"` would output `"abcd7"`.

## Validation

1. Build the module using `Invoke-Build` in the root directory.
2. Run `Import-Module .\bin\PSAddOne`
3. Run `Get-Command -Module PSAddOne`. Verify that only `Add-OneToString` shows as the result.
