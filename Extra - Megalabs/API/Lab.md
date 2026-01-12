# Lab 05. API

## JSON

Use the free testing API at [JSONPlaceholder](https://jsonplaceholder.typicode.com/) with different HTTP request methods.

The endpoint for the testing API is `https://jsonplaceholder.typicode.com`.

### Get

- Get all posts from the `/posts` endpoint

Expected output:

```text
userId  id title                                                                           body
------  -- -----                                                                           ----
     1   1 sunt aut facere repellat provident occaecati excepturi optio reprehenderit      quia et suscipit…
     1   2 qui est esse                                                                    est rerum tempore vitae…
     1   3 ea molestias quasi exercitationem repellat qui ipsa sit aut                     et iusto sed quo iure…
     1   4 eum et est occaecati                                                            ullam et saepe reiciendis voluptatem adipisci…
     1   5 nesciunt quas odio                                                              repudiandae veniam quaerat sunt sed…
...
```

- Get a specific resource from the `/posts` endpoint using any accepted id
Expected output:

```text
userId  id title                                                                           body
------  -- -----                                                                           ----
     1   1 sunt aut facere repellat provident occaecati excepturi optio reprehenderit      quia et suscipit…
```

- Compare the results from using `Invoke-WebRequest` and `Invoke-RestMethod`
  - What is the difference?

---

### Post

- Create a JSON object in PowerShell with a title, body and userId, and post it to `/posts` with `application/json` as the content type

```text
title userId body  id
----- ------ ----  --
post       1 text 101
```

---

## XML

- Get the XML document at `https://www.w3schools.com/xml/cd_catalog.xml` using PowerShell, either by saving the file or by getting the data directly from the web address as you would with an API
- *Optional:* Write an advanced function called `Select-CDInfoAsJson` which accepts pipeline input, selects the Title and Artist properties and outputs it as JSON

```PowerShell
$CDs = Invoke-RestMethod 'https://www.w3schools.com/xml/cd_catalog.xml'
$CDs.CATALOG.CD[2] | Select-CDInfoAsJson"
```
should result in:

```PowerShell
{
    "TITLE":  "Greatest Hits",
    "ARTIST":  "Dolly Parton"
}
```
