# Lab 04. Regex

- One of theese strings contains the character 'ά' (Greek lower case acute alpha). Using the -match operator, set the string containing this character to the variable $MyString.

```powershell
'A pangram (Greek: παν γραμμα, pan gramma, "every letter") or holoalphabetic sentence is a sentence using every letter of a given alphabet at least once. §An example from German is:§§§§§"Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich."§§§The following are examples of pangrams that are shorter than "The quick brown fox jumps over a lazy dog".§§§    1. "The five boxing wizards jump quickly." (31 letters)§§§§    2. "Glib jocks quiz nymph to vex dwarf." (28 letters)§§§§§    3. "Jived fox nymph grabs quick waltz." (28 letters)§§§    4. "Pack my box with five dozen liquor jugs." (32 letters)§§§§§§    5. "How vexingly quick daft zebras jump!" (30 letters§§§    6. "Sphinx of black quartz, judge my vow." (29 letters)§§', , 'A pangram (Greek: παν γράμμα, pan gramma, "every letter") or holoalphabetic sentence is a sentence using every letter of a given alphabet at least once. §An example from German is:§§§§§"Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich."§§§The following are examples of pangrams that are shorter than "The quick brown fox jumps over a lazy dog".§§§    1. "The five boxing wizards jump quickly." (31 letters)§§§§    2. "Glib jocks quiz nymph to vex dwarf." (28 letters)§§§§§    3. "Jived fox nymph grabs quick waltz." (28 letters)§§§    4. "Pack my box with five dozen liquor jugs." (32 letters)§§§§§§    5. "How vexingly quick daft zebras jump!" (30 letters§§§    6. "Sphinx of black quartz, judge my vow." (29 letters)§§',, 'A pangram (Greek: παν γραμμα, pan gramma, "every letter") or holoalphabetic sentence is a sentence using every letter of a given alphabet at least once. §An example from German is:§§§§§"Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich."§§§The following are examples of pangrams that are shorter than "The quick brown fox jumps over a lazy dog".§§§    1. "The five boxing wizards jump quickly." (31 letters)§§§§    2. "Glib jocks quiz nymph to vex dwarf." (28 letters)§§§§§    3. "Jived fox nymph grabs quick waltz." (28 letters)§§§    4. "Pack my box with five dozen liquor jugs." (32 letters)§§§§§§    5. "How vexingly quick daft zebras jump!" (30 letters§§§    6. "Sphinx of black quartz, judge my vow." (29 letters)§§'
```

---

- In this string there are recurring paterns of between 1 and 6 '§' character. Using the -replace operator, replace each occurence with one newline.

---

- Using the Select-String CmdLet, Find all text in the variable matching a word boundary in the $MyString variable.

---

- Using the Select-String CmdLet, Find all characters in the english alphabet in the $MyString variable.

---

- Using the [regex] class, find all words written with greek letters in the $MyString variable.

---

- Using the Select-String CmdLet, Find all words ending a sentence (words that end with a .) in the $MyString variable.

---

- The last 6 lines in the $MyString sentence are random variations of pangrams. Using the [Regex] class and capture groups, create custom objects with;
  - the line order (1 - 6) in which the lines are sorted right now
  - The text of the line without '"'
  - The length of the line, as specified in the parenthesis ("28 letters")
And sort the output according to the length.

