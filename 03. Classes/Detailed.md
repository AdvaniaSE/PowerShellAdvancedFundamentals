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

## Class - Guessing Game

- Create the class `Game`
  - Properties
    - `[int] $GuessCount`
    - `hidden [int] $Target`
  - Constructor
    - The constructor should set `$Target` to a random number between 1 and 100
    - Set `$GuessCount` to 0
  - Method
    - There should be one method called `Guess` which takes a number as a parameter. The method should increase `$GuessCount` by one, compare the entered number to the property `$Target` and return strings according to the following:
      - Lower than `$Target` - 'The guess was too low, try again!'
      - Higher than `$Target` - 'The guess was too high, try again!'
      - Same as `$Target` - 'You won in `$GuessCount` guesses!'

- *Optional:*
  - Create an enum called `GameState` with two values
    - InProgress
    - Completed
  - Add the property `[GameState] $State` to the `Game` class
    - Set `$State` to `[GameState]::InProgress` in the constructor
    - Set `$State` to `[GameState]::Completed` when the user guesses correctly
  - Make the `Guess` method return another message if the game has already been completed

```PowerShell
enum GameState {
    InProgress
    Complete
}

class Game {
    # Properties
    [int] $GuessCount
    [GameState] $State

    # Hidden Property
    hidden [int] $Target

    # Constructor creates a new Game object and randomizes target value between 1 and 100
    Game() {
        $this.Target = Get-Random -Minimum 1 -Maximum 100
        $this.GuessCount = 0
        $this.State = [GameState]::InProgress
    }

    # Method that lets the user Guess the generated target number
    [string] Guess([int]$Guess) {
        $this.GuessCount++
        $GuessResult = ''

        if ($Guess -eq $this.Target) {
            $this.State = [GameState]::Complete

            $GuessResult = "You won in $($this.GuessCount) guesses!"
        }
        elseif ($Guess -lt $this.Target) {
            $GuessResult = 'Target is higher, try again!'
        }
        elseif ($Guess -gt $this.Target) {
            $GuessResult = 'Target is lower, try again!'
        }

        return $GuessResult
    }
}
```

*Tip:* Use the keyword `using` to import classes from a module, importing a module with a class in normally will not import the class type.

---

## *More Reading*

```PowerShell
Get-Help about_Classes
Get-Help about_Methods
Get-Help about_Enum
Get-Help about_Hidden
Get-Help about_Using
```
