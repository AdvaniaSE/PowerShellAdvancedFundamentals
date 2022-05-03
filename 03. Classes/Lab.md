# Lab 03. Classes

- Open the file in your repo named `MyFunctions.ps1` in VSCode.

- Create an enum called `ColorEnum` with the values `red`, `green`, `blue`, `yellow`.
  - Remove the ValidateSet on the `Color` parameter, in the `Add-CourseUser` function
  - Cast the parameter `Color` as type `ColorEnum`
  - Verify that tab completion still behaves as expected.

- Create a class, `User`, with the same properties as your database user
  - Add a contructor to set the properties directly when instantiating the class
  - Add an override of the ToString() Method to output the user as csv, matching the contents of `MyLabFile.csv`
  - Replace the `$MyCsvUser = "$Name,$Age,{0},{1}" -f $Color, $UserId` line in the `Add-CourseUser` function with the newly created class and ToString() method
