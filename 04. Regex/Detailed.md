# Lab 04. Detailed - Regex

- One of these strings contains the character 'ά' (Greek lower case acute alpha). Using the -match operator, set the string containing this character to the variable $MyString.

*Notice: You can also get the strings by running the command*

```PowerShell
$Text = Get-Content '\PowerShellAdvancedFundamentals\04. Regex\sentence.txt'
```

```powershell
$MyString = 'A pangram (Greek: παν γραμμα, pan gramma, "every letter") or holoalphabetic sentence is a sentence using every letter of a given alphabet at least once. §An example from German is:§§§§§"Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich."§§§The following are examples of pangrams that are shorter than "The quick brown fox jumps over a lazy dog".§§§    1. "The five boxing wizards jump quickly." (31 letters)§§§§    2. "Glib jocks quiz nymph to vex dwarf." (28 letters)§§§§§    3. "Jived fox nymph grabs quick waltz." (28 letters)§§§    4. "Pack my box with five dozen liquor jugs." (32 letters)§§§§§§    5. "How vexingly quick daft zebras jump!" (30 letters§§§    6. "Sphinx of black quartz, judge my vow." (29 letters)§§', 'A pangram (Greek: παν γράμμα, pan gramma, "every letter") or holoalphabetic sentence is a sentence using every letter of a given alphabet at least once. §An example from German is:§§§§§"Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich."§§§The following are examples of pangrams that are shorter than "The quick brown fox jumps over a lazy dog".§§§    1. "The five boxing wizards jump quickly." (31 letters)§§§§    2. "Glib jocks quiz nymph to vex dwarf." (28 letters)§§§§§    3. "Jived fox nymph grabs quick waltz." (28 letters)§§§    4. "Pack my box with five dozen liquor jugs." (32 letters)§§§§§§    5. "How vexingly quick daft zebras jump!" (30 letters§§§    6. "Sphinx of black quartz, judge my vow." (29 letters)§§', 'A pangram (Greek: παν γραμμα, pan gramma, "every letter") or holoalphabetic sentence is a sentence using every letter of a given alphabet at least once. §An example from German is:§§§§§"Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich."§§§The following are examples of pangrams that are shorter than "The quick brown fox jumps over a lazy dog".§§§    1. "The five boxing wizards jump quickly." (31 letters)§§§§    2. "Glib jocks quiz nymph to vex dwarf." (28 letters)§§§§§    3. "Jived fox nymph grabs quick waltz." (28 letters)§§§    4. "Pack my box with five dozen liquor jugs." (32 letters)§§§§§§    5. "How vexingly quick daft zebras jump!" (30 letters§§§    6. "Sphinx of black quartz, judge my vow." (29 letters)§§' -match 'ά'

# Or if you import the text useing the text file:
$MyString = $text -match 'ά'

```

- In this string there are recurring patterns of between 1 and 6 '§' characters. Using the -replace operator, replace each occurrence with one newline.

```Powershell
$MyString = $MyString -replace '§+',"`n"
```

---

- Using `Select-String`, find all text in the variable matching a word boundary in the `$MyString` variable.

```Powershell
Select-String -InputObject $MyString -Pattern '\w' -AllMatches
```
*Notice: A word boundary includes any alphanumeric character, but no punctuation.*

---

- Using `Select-String`, find all characters in the English alphabet in the `$MyString` variable.

```Powershell
Select-String -InputObject $MyString -Pattern '[a-zA-Z]+' -AllMatches
```

*Notice: The range operators a-z and A-Z are case sensitive, and will not match any Unicode characters.*

---

- Using the `[regex]` class, find all words written with Greek letters in the `$MyString` variable.

```Powershell
$Pattern = '\p{IsGreek}+'
$AllMatches = [regex]::Matches($MyString, $Pattern)
$AllMatches.Value
```

*Notice: \p is the constructor for many different Unicode characters, such as \p{Ll} which matches any lower case, and \p{LL} which matches any upper case Unicode character.*

---

- Using `Select-String`, find all words ending a sentence (words that end with a .) in the `$MyString` variable.

```Powershell
Select-String -InputObject $MyString -Pattern '[^\s0-9]+\.' -AllMatches
```

Explanation:

```PowerShell
[ # Start match character in list
  ^ # Negated list, Any character not in the following list
  \s # Any whitespace character
  0-9 # Any number between 0 and 9
] # End match character in list
  + # Quantifier, one or more of the previous (in this case, the capturegroup)
  \. # Literal dot '.'
```

---

- The last 6 lines in the $MyString sentence are random variations of pangrams. Using the `[regex]` class and capture groups, create custom objects with:
  - The line order (1 - 6) in which the lines are sorted right now
  - The text of the line without '"'
  - The length of the line, as specified in the parenthesis ("28 letters")
- Sort the resulting list of custom objects by length of the sentence.

```Powershell
$Pattern = '(?<Line>[0-9])\.\s{1}"(?<Text>[^("]*)"\s\((?<PhraseLength>[\d]{2})'
$AllMAtches = [regex]::Matches($MyString, $Pattern)
$ResultObject = $AllMatches | ForEach-Object {
    [pscustomobject]@{
        'Line' = $_.Groups['Line'].Value
        'Text' = $_.Groups['Text'].Value
        'PhraseLength' =  $_.Groups['PhraseLength'].Value
    }
}
$ResultObject | Sort-Object -Property PhraseLength
```

Explanation:

```Powershell
'1. "Jived fox nymph grabs quick waltz." (28 letters)'

# ( # Start of capture group 1
#     ?<Line> # Named capture group 'Line'
#     [ # Start match character in list
#         0-9 # Any number between 0 and 9
#     ] # End match character in list
# ) # End of capture group 1
'1'

# \. # Literal '.'
'.'

# \s # Any whitespace character
#     {1} # Quantifier, exactly one time
' '

# " # Literal '"'
'"'

# ( # Start of capture group 2
#     ?<Text> # Named capture group 'Text'
#     [^ # Start match character _not_ in list
#         ( # Literal '("
#         " # Literal '"'
#     ] # End match character _not_ in list
#     * # Quantifier, between zero and unlimited
# ) # End of capture group 2
'Jived fox nymph grabs quick waltz.'

# " # Literal '"'
'"'

# \s # Any whitespace character
' '

# \(  # Literal '('
'('

# ( # Start of capture group 3
#     ?<PhraseLength> # Named capture group 'PhraseLength'
#     [ # Start match character in list
#         \d # Any digit (equal to [0-9])
#     ] # End match character in list
#     {2} # Quantifier, exactly two times
# ) # End of capture group 3
'28'
```

---

## *More Reading*

```PowerShell
Get-Help about_Regular_Expressions
```

[.NET Regex Quick Reference](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
