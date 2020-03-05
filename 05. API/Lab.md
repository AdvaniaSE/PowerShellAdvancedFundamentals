# Lab 05. API

## JSON

Use the free testing API at [JSONPlaceholder](https://jsonplaceholder.typicode.com/) with different HTTP request methods.

The endpoint for the testing API is `https://jsonplaceholder.typicode.com`.

### Get

- Get all posts from the `/posts` endpoint.
- Get a specific resource from the `/posts` endpoint using any accepted id.
- Compare the results from using `Invoke-WebRequest` and `Invoke-RestMethod`.
  - What is the difference?

---

### Post

- Create a JSON object in PowerShell with a title, body and userId, and post it to `/posts` with `application/json` as the Content-Type.

---

## XML

- Get the XML document at `https://www.w3schools.com/xml/cd_catalog.xml` using PowerShell, either by saving the file or by getting the data directly from the web address as you would with an API.
- *Optional:* Write an advanced function called `Select-CDInfoAsJson` which accepts pipeline input, selects the Title and Artist properties and outputs it as JSON.

`"$CD | Select-CDInfoAsJson"` should result in:

```PowerShell
{
    "TITLE":  "Greatest Hits",
    "ARTIST":  "Dolly Parton"
}
```
