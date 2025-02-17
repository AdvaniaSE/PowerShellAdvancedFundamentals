function testVariables {
    [CmdletBinding()]
    param($name)

    Write-Output "hello $name"
    Write-Output "PSBoundParameters`n$($PSBoundParameters | ConvertTo-Json -Compress)"
    Write-Output "PSCmdlet`n$($PSCmdlet | ConvertTo-Json -Compress)"
    Write-Output "PSCommandPath`n$($PSCommandPath | ConvertTo-Json -Compress)"
}