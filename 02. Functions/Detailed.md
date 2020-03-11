# Lab 02. Detailed - Functions

Note that the functions written in this lab are only examples of how they could be written.

## Create any or all of the filters below

1. A filter called `Select-LessThanTen` that selects and outputs numbers less than 10 from input

```PowerShell
# A filter that selects numbers less than 10

# Declaring a filter is done using the filter keyword
filter Select-LessThanTen {
  # Find out if number is less than 10 using $_
    if ($_ -lt 10) {
      Write-Output $_
    }
}
```

2. A filter called `Select-EvenNumber` that selects and outputs even numbers from input

```PowerShell
# A filter that selects even numbers

filter Select-EvenNumber {
  # Find out if input is evenly divisible by 2 using the modulo operator
    if ($_ % 2 -eq 0) {
      Write-Output $_
    }
}
```

3. A filter of your own choice that uses the input in pipeline

---

## Create any or all of the functions below

1. `New-FileInDirectory` - A function that creates a file in a directory with the file name as the parameter `Name`

```PowerShell
function New-FileInDirectory {
    param(
      $Name
    )

    New-Item -Name $Name -Path 'C:\Temp'
}
```

2. `Add-FiveToNumber` - A function that adds five to the parameter `Number` and outputs the result

```PowerShell
function Add-FiveToNumber {
    param(
      [int]$Number
    )

    Write-Output ($Number + 5)
}
```

3. A function of your own choice that uses at least one parameter.

---

## Add advanced functionality to any or all of the functions

1. `New-FileInDirectory`

Add parameters and validation to the function.

- Add a `string` parameter `Path` that decides the location of the new file, with validation that the directory exists
- Add validation to the `Name` parameter to ensure that the file name is a `string` between 5 to 10 characters
- *Optional:* Add the `string` parameter `Content` for the text that the new file should contain

```PowerShell
function New-FileInDirectory {
    [CmdletBinding()]
    param(
        # Set the name parameter to mandatory and specify type
        [Parameter(Mandatory)]
        [ValidateLength(5,10)]
        [string]$Name,

        # Validation from ValidateScript passes if the output from the scriptblock is $true
        [ValidateScript({
            if (Test-Path $_) {
                $true
            }
            else {
                # It is best practice to throw or use Write-Error if the validation does not pass, to clarify the error message
                throw 'Path does not exist!'
            }
        })]
        # Default the path to the current location if not specified
        [string]$Path = (Get-Location),

        # Optional parameter
        # Default the content to an empty string
        [string]$Content = ''
    )

    New-Item -Name $Name -Path $Path -Value $Content
}
```

2. `Add-FiveToNumber`

Add validation and help data.

- Add validation to the parameter `Number` to ensure it is a positive number less than 1000
- Add at least synopsis as comment-based help to the function
- Add OutputType `int` to the function

```PowerShell
<#
.SYNOPSIS
  Adds 5 to a number.
.DESCRIPTION
  Adds 5 to a specified number and outputs the result as an [int].
.EXAMPLE
  PS C:\> Add-FiveToNumber -Number 10
  
  The example adds 5 to the number 10 and outputs 15
#>
function Add-FiveToNumber {
    # Add output type
    [OutputType([int])]
    [CmdletBinding()]
    param(
        # Set the number parameter to mandatory and specify type
        [Parameter(Mandatory)]
        [int]$Number
    )

    Write-Output ($Number + 5)
}
```

3. `Get-EachDayUntilDate`

Write an advanced function that lists every day between now and a date in the future.

- Add a `datetime` parameter called `Date` with validation that the date is in the future

```PowerShell
function Get-EachDayUntilDate {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        # Make sure the input date is in the future
        [ValidateScript({
            if ($_ -gt (Get-Date)) {
                $true
            }
            else {
                throw 'Date is not in the future!'
            }
        })]
        [datetime]$Date
    )

    # Save today's date
    $Day = Get-Date
    # While today's date is not the input date
    while ($Day.Date -ne $Date.Date) {
        # Add one day to the date and output it
        $Day = $Day.AddDays(1)
        Write-Output $Day.Date
    }
}
```

4. An advanced function of your choice that uses at least two parameters with validation.

---

## *More Reading*

```PowerShell
Get-Help about_Functions
Get-Help about_Functions_Advanced
Get-Help about_Functions_Advanced_Methods
Get-Help about_Functions_Advanced_Parameters
Get-Help about_Functions_CmdletBindingAttribute
Get-Help about_Functions_OutputTypeAttribute
Get-Help about_Comment_Based_Help
```
