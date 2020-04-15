function Get-TempFiles {
    param(
        [switch]$Recurse
    )

    try {
        Get-ChildItem 'C:\Temp' -Recurse:$Recurse
    }
    catch {
       Write-Output @(
           'C:\Temp does not exist!',
           'Here is a fake file',
           'Here is another one'
       )
    }
}

$Result = Get-TempFiles -Recurse

foreach ($File in $Result) {
    Write-Output $File
}
