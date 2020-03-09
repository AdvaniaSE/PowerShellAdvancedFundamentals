# Megalab - Detailed

A collection of extra, more complex labs.

---

## `Get-LineSum`

- Write the function `Get-LineSum` that has a string parameter called `Path`. The function should validate that the file specified in this parameter exists. Specifying the file "Textlab.txt" in this folder should summarizes the input values and presents a result as an output from the function.

```PowerShell
# ExampleFile.txt content
+1 # Starts with 1
+4 # Incremented to 5
-3 # Reduced to 2
+9 # Incremented to 11

# Should output 11
Get-LineSum .\ExampleFile.txt
```

- Add a switch parameter called `FirstDoubleOccurrence` to the function. If this parameter is used the function should instead output the first value that is reached twice during the summarization of the values.

```PowerShell
# ExampleFile2.txt content

+10 # Starts with 10  
-2 # Reduced to 8  
+3 # Incremented to 11  
-5 # Reduced to 6  
+2 # Incremented to 8 again
...

# The function should output 8 even if there are more numbers
Get-LineSum .\ExampleFile2.txt -FirstDoubleOccurrence
```

---

- Create a Star Wars module!
  - Using the Star wars API at [https://swapi.co](https://swapi.co)
  - A public git repo on GitHub to store it.
  - Include error handling for searches without hits.
  - Make it possible to output the result in Wookiee.
  - Write tests to verify functionality
    - Mock response from the API using Pester's Mock keywords

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

    # Method that lets the user guess the generated target number
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

---

- Bring your own lab!
  - Bring something that you want to show, need help with or have questions about!