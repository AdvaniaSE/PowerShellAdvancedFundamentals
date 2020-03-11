# Lab 06. Error Handling

- Generate an error by running a command that doesn't exist in PowerShell

---

- Change the `$ErrorView` variable and note the difference between messages. Valid values for ErrorView are
  - NormalView
  - CategoryView
  - ConciseView (This is the default view)

---

- Explore the error using `Get-Error`

---

- Create a try/catch block to capture the error and instead of an error, return the string "I captured the error: \<ErrorMessage\>"

---

- Using the information from `Get-Error`, specify the type of error in the catch block

---

- Change the type of error generated in the try block and add another catch block to catch the error

---

- Add a finally block outputting the string "Finally in the finally block." and verify that this block is run no matter which path the code takes

---

- Change the `$ErrorActionPreference`, and see if the behavior changes. Valid values are:
  - SilentlyContinue
  - Stop
  - Continue
  - Inquire
  - Ignore
  - Suspend
  - Break
  