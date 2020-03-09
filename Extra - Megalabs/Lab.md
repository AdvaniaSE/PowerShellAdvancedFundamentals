# Megalab

A collection of extra, more complex labs.

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

---

- Bring your own lab!
  - Bring something that you want to show, need help with or have questions about!
  