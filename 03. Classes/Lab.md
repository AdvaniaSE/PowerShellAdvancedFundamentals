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

# Expected outcome

After this lab you should have a file named `MyFunctions.ps1` in your GitHub repo. 
In the file there should be:

- An enum called `ColorEnum` 
- A class called `Participant` making use of the `ColorEnum`

Both of these should be used in the `Add-CourseUser` function

An example of the outcome may be found in the file `MyFunctions.ps1` in this folder.
