# Working with XML in PowerShell

1. Get the XML document at `https://www.w3schools.com/xml/cd_catalog.xml`, either save it as a file and read the content in PowerShell, or get the data directly from the web address.
2. Write a filter named Select-CDInfoAsJson which selects the Title and Artist properties and outputs it as JSON.

Example: `"$Content | Select-CDInfoAsJson"` should result in:

```PowerShell
{
    "TITLE":  "Greatest Hits",
    "ARTIST":  "Dolly Parton"
}
```
