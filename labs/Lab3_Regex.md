# Regex in PowerShell

`$Greeting = 'Hi my name is Emanuel'`
`$Pattern = 'Hi my name is (\w+)'`

`$Greeting -match $Pattern`
`$Matches`

$Matches is an automatic variable created by PowerShell which holds all matches from the most recent `-match`.

## Task

Replace 'Emanuel' in `$Greeting` with your own name using Regex.
