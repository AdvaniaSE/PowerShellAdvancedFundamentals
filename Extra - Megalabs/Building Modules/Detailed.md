# Lab 08. Detailed - Building Modules

## PSAddOne.psm1

Create a module called PSAddOne with two functions.

- First create a new file called PSAddOne.psm1

### Add-OneToValue

`"Add-OneToValue"` is a normal "helper" function that takes `Number` as a parameter, adds 1 to it and outputs the new number

```PowerShell
function Add-OneToValue {
    param(
        [int]$Number
    )

    Write-Output ($Number + 1)
}
```

### Add-OneToString

`"Add-OneToString"` is an advanced function that takes a string as input and validates that it matches "ccccn" where c is a letter and n is a number. The function should split the string to get the number, add to it using the function `"Add-OneToValue"` and output the string with the new number instead.

Examples:

- `Add-OneToString -String 'abcd6'` would output `'abcd7'`
- `Add-OneToString -String 'cool9'` would output `'cool10'`

```PowerShell
function Add-OneToString {
    [CmdletBinding()]
    param(
        # ^       Start of line
        # [       Start match character in group
        #   a-z   Any lowercase character in the english alphabet
        #   A-Z   Any uppercase character in the english alphabet
        # ]       End match character in group
        # {4}     Quantifier, exactly 4 of the previous character group
        # \d      Any decimal digit
        # $       End of line
        [ValidatePattern('^[a-zA-Z]{4}\d$')]
        [string]$String
    )

    [int]$Number = $String.Substring(4)

    $Number = Add-OneToValue -Number $Number

    Write-Output ($String -replace '\d',$Number)
}
```

---

## Plaster

- Make sure the following modules are installed on your computer
  - [Plaster](https://github.com/PowerShell/Plaster)
  - [InvokeBuild](https://github.com/nightroman/Invoke-Build)
  - [PowerShellGet](https://docs.microsoft.com/en-us/powershell/module/powershellget)
  - [ModuleBuilder](https://github.com/PoshCode/ModuleBuilder)
  - [Pester](https://github.com/pester/Pester)
- Download the [gyPSum](https://github.com/SimonWahlin/gyPSum) template
- Run the following command, specifying the directory of the gyPSum template
  - `Invoke-Plaster -TemplatePath .\gyPSum\Module -DestinationPath .`
- Create module `PSAddOne`

### Private Function

In the "Private" folder, create the script "Add-OneToValue.ps1" and copy or move the function called `Add-OneToValue` there.

### Public Function

In the "Public" folder, create a script called "Add-OneToString.ps1" and copy or move the function called `Add-OneToString` there.

### Validation

1. Build the module using `Invoke-Build` in the root directory of the generated module folder.
2. Run `Import-Module .\bin\PSAddOne`
3. Run `Get-Command -Module PSAddOne`. Verify that only `Add-OneToString` shows as the result.
4. Run the command `Add-OneToString` and verify that the output works as expected.

---

## *More Reading*

```PowerShell
Get-Help about_Modules
```

- [Plaster](https://github.com/PowerShell/Plaster)
