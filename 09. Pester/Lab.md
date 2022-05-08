# Lab 09. Pester

- Add a `Tests` folder to the root of your module, and in it, create a file called `MyModule.Tests.ps1` where you create the tests in this lab.

- In the `MyModule` module the `Add-CourseUser` currently does not accept some characters and diacritics in names. Write a test for each of the following names:
  - 'Jason Derülo'
  - 'Björn Skifs'
  - 'Will.i.am'
  - 'Sinéad O´Connor'
- Make sure when running the test you don't actually update the database by mocking the `Set-Content` CmdLet. Create a mock that outputs `works!` instead.
- *Optional:* Rewrite the test to use testcases instead of unique tests.

- In the `MyModule` module, in the `Get-CourseUser`, you can set both the `Name` and the `OlderThan` parameter at the same time. Write a pester test that verifies `Get-CourseUser` throws an error if both parameters are set.
  - *Optional:* Write a pester test that verifies `Get-CourseUser` does not throw an error if only the `Name` parameter is set.
  - *Optional:* Write a pester test that verifies `Get-CourseUser` does not throw an error if only the `OlderThan` parameter is set.
- Use `ParameterSet` to fix the problem in the module.
