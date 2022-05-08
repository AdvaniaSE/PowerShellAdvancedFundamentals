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

---

- Create a `.psm1` module file in the `MyModule\MyModule` folder
  - Make sure the module:
    - Imports all functions from the `Classes` folder
    - Imports all functions from the `Private` folder
    - Imports all functions from the `Public` folder
  - Import the module, and check its details using `Get-Module`
  - Check which commands you get from the module
  - Remove the module from the active session

---

- Create a module manifest for the module.
  - Verify you can import the module, and check its details using `Get-Module`
  - Check which commands you get from the module
  - Remove the module from the active session
  - Edit the manifest to
    - Export the functions in the `Public` folder
    - Have a better module version
    - Set the correct copyright data
  - Import the module again, and verify:
    - The new module settings
    - That you only get the commands you want to export

---

- Import the module and read the help documentation for the `Get-CourseUser` function
- Add comment based help to the `Get-CourseUser` command
  - Open the file `Get-CourseUser.ps1` in vscode
  - On the first line of the file, press `Ctrl+Space` to trigger the intellisense menu
  - select `Comment-help` to get the default help text
  - Fill in some data in the different sections
- Import the module again and verify the help documentation is updated

---

## Extra lab - Documentation

- Use the `PlatyPS` module to export and create markdown based help in the `MyModule\Documentation` folder

## Extra lab - Build Script

- Use the `InvokeBuild` module to create a build script that:
  - Compiles the module in to one psm1/psd1 file
  - Compiles the markdown help documentation and includes it
  - Outputs the resulting module to a bin folder
    - If there already is a bin folder, remove it.
