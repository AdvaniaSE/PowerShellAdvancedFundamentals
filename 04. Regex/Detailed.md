# Lab 04. Detailed - Regex

- Open the file in your repo named `MyFunctions.ps1` in VSCode.

- In the function `Add-CourseUser`, Add regex parameter validation for the parameter `Name` to make sure:
  - Name starts with a capital letter A to Z
  - Name consists of only word characters, hyphens, and spaces
    - [Read why this is a generally bad, yet very common practice](https://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/)
  - Has a good error message for erroneous input.

```PowerShell
[ValidatePattern({'^[A-Z][\w\-\s]*$'}, ErrorMessage = 'Name is in an incorrect format')]
```

- Create a new function called `Confirm-CourseID` that reads the user database using the `GetUserData` function, and validates all ID's consists of numbers only.
  - Make it output any users with erroneous ID.

```PowerShell
function Confirm-CourseID {
    Param()

    $AllUsers = GetUserData

    foreach ($User in $AllUsers) {
        if ($User.Id -notmatch '^\d+$') {
            Write-Output "User $($User.Name) has mismatching id: $($User.Id)"
        }
    }
}
```

---

The resulting `MyFunctions.ps1` file can be found in this folder.

---

## *More Reading*

```PowerShell
Get-Help about_Regular_Expressions
```

[.NET Regex Quick Reference](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
[Regex101](https://regex101.com/)
