# Lab 04. Regex

- Open the file in your repo named `MyFunctions.ps1` in VSCode.

- In the function `Add-CourseUser`, Add regex parameter validation for the parameter `Name` to make sure:
  - Name starts with a capital letter
  - Name consists of only word characters, hyphens, and spaces
    - [Read why this is a generally bad, yet very common practice](https://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/)

- Create a new function called `Confirm-CourseID` that reads the user database using the `GetUserData` function, and validates all ID's consists of numbers only.
  - Make it output any users with erroneous ID to the error stream
