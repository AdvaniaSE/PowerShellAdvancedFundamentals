$MyUserListFile = "$PSScriptRoot\MyLabFile.csv"

$MyName = Read-Host -Prompt 'What is your name?'
[int]$MyAge = Read-Host -Prompt 'What is your age?'

$MyColorArray = 'red', 'green', 'blue', 'yellow'
$MyColor = $MyColorArray | Out-ConsoleGridView -OutputMode Single -Title 'What is your favourite color?'

$MyUserId = Get-Random -Minimum 10 -Maximum 100000

$MyCsvUser = "$MyName,$MyAge,{0},{1}" -f $MyColor, $MyUserId

$NewCSv = Get-Content $MyUserListFile -Raw
$NewCSv += $MyCsvUser

Set-Content -Value $NewCSv -Path $MyUserListFile
