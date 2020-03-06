# Lab 09. Detailed - Pester

## Write Pester Tests for the Module PSAddOne

Create unit tests for `Add-OneToValue` and `Add-OneToString`.

### `Add-OneToValue`

- `Add-OneToValue 10` should output `11`.
- `Add-OneToValue -5` should output `-4`.

Because Add-OneToValue is defined as a private function it is not exposed by your normal powershell session.
By using Pesters InModuleScope command you can execute test code inside the module, giving you access to its internal functions, variables, and aliases

```PowerShell
InModuleScope PSAddOne { 
    Describe "Add-OneToValue" {
        It "Should increment positive numbers" {
            Add-OneToValue 10 | Should -Be 11
        }

        It "Should increment negative numbers" {
            Add-OneToValue -5 | Should -Be -4
        }
    }
}
```

### `Add-OneToString`

- `Add-OneToString 'test1'` should output `test2`.
- `Add-OneToString 'abc'` should throw.

When testing for parameter validation errors, the test block needs to be in curly braces `{}` to properly capture the error.

```PowerShell
Describe "Add-OneToString" {
    It "Should increment positive numbers" {
        Add-OneToString 'test1' | Should -Be 'test2'
    }

    It "Should require four characters and one digit" {
        {Add-OneToString 'abc'} | Should -Throw
    }
}
```

## Run Tests

1. Test the functions using `Invoke-Pester` with the functions loaded.
2. Add the tests to `PSAddOne/Test/Unit/PSAddOne.Tests.ps1` and re-build the module from the previous lab using Plaster and `Invoke-Build`.
3. There is a bug in the code for Add-OneToString where the Regex prevents us from using negative numbers. use Test driven development to solve this bug.
    
- Write a test to verify this bug.

```Powershell
Describe "Add-OneToString" {
    It "Should increment negative numbers, -1" {
        Add-OneToString 'test-1' | Should -Be 'test0'
    }

    It "Should increment negative numbers, -9" {
        Add-OneToString 'test-9' | Should -Be 'test-8'
    }
}
```

- Run pester to make shure it shows test error.

- rewrite the function to allow input of negative numbers between -1 and -9

```Powershell
function Add-OneToString {
    [CmdletBinding()]
    param(
        # ^       Start of line
        # [       Start match character in group
        #   a-z   Any lowercase character in the english alphabet
        #   A-Z   Any uppercase character in the english alphabet
        # ]       End match character in group
        # {4}     Quantifier, exactly 4 of the previous character group
        # -       Literal dash '-'
        # ?       Quantifier, Zero or one of the previous character
        # \d      Any decimal digit
        # $       End of line
        [ValidatePattern('^[a-zA-Z]{4}-?\d$')]
        [string]$String
    )

    [int]$Number = $String.Substring(4)

    $Number = Add-OneToValue -Number $Number

    # Since we changed the input, we also change the replace to include possible negative numbers.
    Write-Output ($String -replace '-?\d$',$Number)
}
```

- Run pester again to verify the bug has been fixed.

---

## *More Reading*

```PowerShell
Get-Help about_Pester
```

- [Pester](https://github.com/pester/Pester)
