# Calling a Rest API using PowerShell

Use the free testing API at [JSONPlaceholder](https://jsonplaceholder.typicode.com/) with different HTTP request methods.

The endpoint for the testing API is `https://jsonplaceholder.typicode.com`.

## Get
- Get a specific resource from the `/posts` endpoint using any `userId`. 
- Get all posts from the `/posts` endpoint. Compare the results from using Invoke-WebRequest and Invoke-RestMethod.

## Post
- Create a JSON object in PowerShell with a title, body and userId, and post it to `/posts` with `application/json` as the Content-Type.
