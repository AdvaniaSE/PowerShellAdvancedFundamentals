# Lab 02. Functions

## Create any or all of the filters below

1. A filter called `Select-LessThanTen` that selects and outputs numbers less than 10 from input.

2. A filter called `Select-EvenNumber` that selects and outputs even numbers from input.

3. A filter of your own choice that uses the input in pipeline.

---

## Create any or all of the functions below

1. `New-FileInDirectory` - A function that creates a file in a directory with the file name as the parameter `Name`.

2. `Add-FiveToNumber` - A function that adds five to the parameter `Number` and outputs the result.

3. A function of your own choice that uses at least one parameter.

---

## Add advanced functionality to any or all of the functions

1. `New-FileInDirectory`

Add parameters and validation to the function.

- Add a `string` parameter `Path` that decides the location of the new file, with validation that the directory exists.
- Add validation to the `Name` parameter to ensure that the file name is a `string` of at least 5 characters.
- *Optional:* Add the `string` parameter `Content` for the text that the new file should contain.

2. `Add-FiveToNumber`

Add validation and help data.

- Add validation to the parameter `Number` to ensure it is a positive number less than 1000.

- Add a description as comment-based help to the function.

- Add OutputType `int` to the function.

3. `Get-EachDayUntilDate`

Write an advanced function that lists every day between now and a date in the future.

- Add a `datetime` parameter  called `Date` with validation that the date is at least one day in the future.

4. An advanced function of your choice that uses at least two parameters with validation.
