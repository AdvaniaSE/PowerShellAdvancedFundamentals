# Lab 03. Detailed - Classes

- Open the file in your repo named `MyFunctions.ps1` in VSCode.

- Create an enum called `ColorEnum` with the values `red`, `green`, `blue`, `yellow`.
  - Remove the ValidateSet on the `Color` parameter in the `Add-CourseUser` function
  - Cast the parameter `Color` as type `ColorEnum`
  - Verify that tab completion still behaves as expected.

```PowerShell
enum ColorEnum {
    red
    green
    blue
    yellow
}

###

function Add-CourseUser {
    [CmdletBinding()]
    Param (
        $DatabaseFile = "$PSScriptRoot\MyLabFile.csv",

        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [Int]$Age,

        [Parameter(Mandatory)]
        [ColorEnum]$Color,

        $UserID = (Get-Random -Minimum 10 -Maximum 100000)
    )
    
    $MyCsvUser = "$Name,$Age,{0},{1}" -f $Color, $UserId
    
    $NewCSv = Get-Content $DatabaseFile -Raw
    $NewCSv += $MyCsvUser

    Set-Content -Value $NewCSv -Path $DatabaseFile
}

```

- Create a class, `Participant`, with the same properties as your database user
  - Add a contructor to set the properties directly when instantiating the class
  - Add an override of the ToString() Method to output the user as csv, matching the contents of `MyLabFile.csv`
  - Replace the `$MyCsvUser = "$Name,$Age,{0},{1}" -f $Color, $UserId` line in the `Add-CourseUser` function with the newly created class and ToString() method

```PowerShell
class Participant {
    [string] $Name
    [int] $Age
    [ColorEnum] $Color 
    [int] $Id

    Participant([String]$Name, [int]$Age, [ColorEnum]$Color, [int]$Id) {
        $This.Name = $Name
        $This.Age = $Age
        $This.Color = $Color
        $This.Id = $Id
    }

    [string] ToString() {
        Return '{0},{1},{2},{3}' -f $This.Name, $This.Age, $This.Color, $This.Id
    }
}

###

function Add-CourseUser {
    [CmdletBinding()]
    Param (
        $DatabaseFile = "$PSScriptRoot\MyLabFile.csv",

        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [Int]$Age,

        [Parameter(Mandatory)]
        [ColorEnum]$Color,

        $UserID = (Get-Random -Minimum 10 -Maximum 100000)
    )
    
    $MyNewUser = [Participant]::new($Name, $Age, $Color, $UserId)
    $MyCsvUser = $MyNewUser.ToString() 
    
    $NewCSv = Get-Content $DatabaseFile -Raw
    $NewCSv += $MyCsvUser

    Set-Content -Value $NewCSv -Path $DatabaseFile
}
```

The resulting `MyFunctions.ps1` file can be found in this folder.

---

## *More Reading*

```PowerShell
Get-Help about_Classes
Get-Help about_Methods
Get-Help about_Enum
Get-Help about_Hidden
Get-Help about_Using
```
