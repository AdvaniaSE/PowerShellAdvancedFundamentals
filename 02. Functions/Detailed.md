# Lab 02. Detailed - Functions

## Create any or all of the filters below

1. A filter that selects and outputs numbers less than 10 from input

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

2. A filter that selects and outputs even numbers from input

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

1. A function that adds five to a number parameter from input

2. A function that converts and outputs a string parameter from input to uppercase

3. A function of your own choice that uses at least one parameter

---

## Create any or all of the advanced functions below

1. An advanced function that creates a file in a specified directory
  
- Add a string parameter for path with validation that the directory exists
- Add a string parameter for file name with validation that it is at least 5 characters
- *Optional:* Add a string parameter for the text content of the file that is to be created

2. An advanced function that lists every number between the input and 1000

- Add a int parameter with validation that it is less than 1000

3. An advanced function that lists every day between now and a date in the future

- Add a datetime parameter with validation that the date is at least one day in the future

4. An advanced function of your choice that uses at least two parameters with validation

---

## *More Reading*

```PowerShell
Get-Help about_Functions
Get-Help about_Functions_Advanced
Get-Help about_Functions_Advanced_Methods
Get-Help about_Functions_Advanced_Parameters
Get-Help about_Functions_CmdletBindingAttribute
Get-Help about_Functions_OutputTypeAttribute
```
