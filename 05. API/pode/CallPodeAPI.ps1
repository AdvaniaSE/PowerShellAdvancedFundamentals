# Search for users using query string, Color, Age, or Name. Exact matches.

Invoke-RestMethod 'http://localhost:666/GetUser'

Invoke-RestMethod 'http://localhost:666/GetUser?Color=Red'

# Add users using either Get or Post method

Invoke-RestMethod 'http://localhost:666/AddUser?Name=James Brown&Age=73&Color=Brown' -Method Get

Invoke-RestMethod 'http://localhost:666/TestThings' -Method Post -Body @{
    Name  = 'James Brown'
    Age = 73
    Color = 'Brown'
}