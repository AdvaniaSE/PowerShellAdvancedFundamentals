# Lab 03. Detailed - Classes

## Enum - Months

- Create an enum called `Month` with the name of each month as the values

```PowerShell
enum Month {
    January
    February
    March
    April
    May
    June
    July
    August
    September
    October
    November
    December
}
```

- Run the following in PowerShell, what do you get as output?

```PowerShell
[Month]2

# The output will be March
```

*Tip:* An enum is a defined, restricted set of values that are mapped to numbers. Using enums for program states or values normally represented by numbers in code can make them more human readable.

---

## Class - Participant

- Write the class `Participant` with the following two properties
  - `[string] $Name`
  - `[int] $Age`
- Use the class `Participant` in a new class called `Course` with two properties of its own
  - `[Participant[]] $Participants`
  - `[datetime] $Date`
- Create a new course and add two participants to it

```PowerShell
class Participant {
    [string] $Name
    [int] $Age
}

class Course {
    [Participant[]] $Participants
    [datetime] $Date
}

# Create a new course object
$Course = [Course]::new()

# Create participants and set the name and age
$First = [Participant]::new()
$First.Name = 'Person 1'
$First.Age = 30

$Second = [Participant]::new()
$Second.Name = 'Person 2'
$Second.Age = 40

# Add current date and participants to course
$Course.Date = Get-Date
$Course.Participants += $First
$Course.Participants += $Second

# Inspect the values of the course and participants
Write-Output $Course
Write-Output $Course.Participants
```

*Tip:* Use the keyword `using` to import classes from a module, importing a module with a class using `Import-Module` will not import the class type.

---

## *More Reading*

```PowerShell
Get-Help about_Classes
Get-Help about_Methods
Get-Help about_Enum
Get-Help about_Hidden
Get-Help about_Using
```
