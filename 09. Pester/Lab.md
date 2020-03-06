# Lab 09. Pester

## Write Pester Tests for the Module PSAddOne

Create unit tests for `Add-OneToValue` and `Add-OneToString`.

### `Add-OneToValue`

- `Add-OneToValue 10` should output `11`.
- `Add-OneToValue -5` should output `-4`.

### `Add-OneToString`

- `Add-OneToString "test1"` should output `"test2"`.
- `Add-OneToString ""` should throw.

## Run Tests

1. Test the functions using `Invoke-Pester` with the functions loaded.
2. Add the tests to `PSAddOne/Test/Unit/PSAddOne.Tests.ps1` and re-build the module from the previous lab using Plaster and `Invoke-Build`.
3. There is a bug in the code for Add-OneToString where the Regex prevents us from using negative numbers. use Test driven development to solve this bug.
    - Write a test to verify this bug.
    - Run pester to make shure it shows test error.
    - rewrite the function to allow input of negative numbers between -1 and -9
    - Run pester again to verify the bug has been fixed.
