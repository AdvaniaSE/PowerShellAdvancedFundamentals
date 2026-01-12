
Param (
    $DatabaseFile = "$PSScriptRoot\MyLabFile.csv",

    [Parameter(Mandatory)]
    [string]$Name,

    [Parameter(Mandatory)]
    [Int]$Age,

    [Parameter(Mandatory)]
    [String]$Color,

    $UserID = (Get-Random -Minimum 10 -Maximum 100000)
)
    
$MyCsvUser = "$Name,$Age,{0},{1}" -f $Color, $UserId
    
$NewCSv = Get-Content $DatabaseFile -Raw
$NewCSv += $MyCsvUser

try {
    Set-Content -Value $NewCSv -Path $DatabaseFile
    Write-Output "Successfully added $Name"
}
catch {
    Write-Output "Failed to add $Name"
}
