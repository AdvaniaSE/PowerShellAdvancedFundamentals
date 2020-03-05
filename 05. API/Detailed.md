# Lab 05. Detailed - API

## JSON

Use the free testing API at [JSONPlaceholder](https://jsonplaceholder.typicode.com/) with different HTTP request methods.

The endpoint for the testing API is `https://jsonplaceholder.typicode.com`.

### Get

- Get all posts from the `/posts` endpoint.

```PowerShell
Invoke-RestMethod 'https://jsonplaceholder.typicode.com/posts'
```

- Get a specific resource from the `/posts` endpoint using any accepted id.

```PowerShell
Invoke-RestMethod 'https://jsonplaceholder.typicode.com/posts/12'
```

- Compare the results from using `Invoke-WebRequest` and `Invoke-RestMethod`.

```PowerShell
Invoke-RestMethod 'https://jsonplaceholder.typicode.com/posts/12'

userId id title                                 body
------ -- -----                                 ----
     2 12 in quibusdam tempore odit est dolorem itaque id aut magnam...

Invoke-WebRequest 'https://jsonplaceholder.typicode.com/posts/12'

StatusCode        : 200
StatusDescription : OK
Content           : {
                      "userId": 2,
                      "id": 12,
                      "title": "in quibusdam tempore odit est dolorem",
                      "body": "itaque id aut magnam\npraesentium quia et ea odit et ea voluptas et\nsapiente quia nihil amet occaecati quia..."
RawContent        : HTTP/1.1 200 OK
                    Connection: keep-alive
                    Access-Control-Allow-Credentials: true
                    Pragma: no-cache
                    X-Content-Type-Options: nosniff
                    CF-Cache-Status: HIT
                    Age: 1072
                    Expe...
Forms             : {}
Headers           : {[Connection, keep-alive], [Vary, Origin, Accept-Encoding], [Access-Control-Allow-Credentials, true], [Pragma, no-cache]...}
Images            : {}
InputFields       : {}
Links             : {}
ParsedHtml        : mshtml.HTMLDocumentClass
RawContentLength  : 250
```

- What is the difference?
  - `Invoke-RestMethod` is built for working with API endpoints, and PowerShell helps you interpret the data in the right format.
  - `Invoke-WebRequest` lets you dig into the different properties of the actual web request. It's useful if you need status codes or information about the request, or if PowerShell tries to interpret the data the wrong way. The raw result of the request is stored in the `Content` property of the resulting object. If the result is in JSON you can use `ConvertFrom-Json` to convert it to an object.

---

### Post

- Create a JSON object in PowerShell with a title, body and userId, and post it to `/posts` with `application/json` as the Content-Type.

---

## XML

- Get the XML document at `https://www.w3schools.com/xml/cd_catalog.xml` using PowerShell, either by saving the file or by getting the data directly from the web address as you would with an API.

```PowerShell
$CDs = Invoke-RestMethod 'https://www.w3schools.com/xml/cd_catalog.xml'
```

- *Optional:* Write an advanced function called `Select-CDInfoAsJson` which accepts pipeline input, selects the Title and Artist properties and outputs it as JSON.

`"$CD | Select-CDInfoAsJson"` should result in:

```PowerShell
{
    "TITLE":  "Greatest Hits",
    "ARTIST":  "Dolly Parton"
}
```

```PowerShell
function Select-CDInfoAsJson {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        $CD
    )

    process {
        Write-Output $CD | Select-Object TITLE,ARTIST | ConvertTo-Json
    }
}

$CDs.CATALOG.CD | Select-CDInfoAsJson
```

---

## *More Reading*

```PowerShell
Get-Help Invoke-RestMethod -Full
Get-Help Invoke-WebRequest -Full
```
