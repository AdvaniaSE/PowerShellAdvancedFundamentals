# Lab 09. Detailed - Pester

## Write Pester Tests for the Module PSAddOne

Create unit tests for `Add-OneToValue` and `Add-OneToString`.

### `Add-OneToValue`

- `Add-OneToValue 10` should output `11`.
- `Add-OneToValue -5` should output `-4`.

```PowerShell
Describe "Add-OneToValue" {
    It "Should increment positive numbers" {
        Add-OneToValue 10 | Should -Be 11
    }

    It "Should increment negative numbers" {
        Add-OneToValue -5 | Should -Be -4
    }
}
```

### `Add-OneToString`

- `Add-OneToString 'test1'` should output `test2`.
- `Add-OneToString 'abc'` should throw.

```PowerShell
Describe "Add-OneToString" {
    It "Should increment positive numbers" {
        Add-OneToString 'test1' | Should -Be 'test2'
    }

    It "Should increment negative numbers" {
        Add-OneToString 'abc' | Should -Throw
    }
}
```

## Run Tests

1. Test the functions using `Invoke-Pester` with the functions loaded.
2. Add the tests to `PSAddOne/Test/Unit/PSAddOne.Tests.ps1` and re-build the module from the previous lab using Plaster and `Invoke-Build`.

---

## *More Reading*

```PowerShell
Get-Help about_Pester
```

- [Pester](https://github.com/pester/Pester)
