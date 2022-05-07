function Add-CourseUser {
    [CmdletBinding()]
    Param (
        $DatabaseFile = "$PSScriptRoot\..\MyLabFile.csv",

        [Parameter(Mandatory)]
        [ValidatePattern({'^[A-Z][\w\-\s]*$'}, ErrorMessage = 'Name is in an incorrect format')]
        [string]$Name,

        [Parameter(Mandatory)]
        [Int]$Age,

        [Parameter(Mandatory)]
        [ColorEnum]$Color,

        $UserID = (Get-Random -Minimum 10 -Maximum 100000)
    )
    
    $MyNewUser = [Participant]::new($Name, $Age, $Color, $UserId)
    $MyCsvUser = $MyNewUser.ToString() 
    
    $NewCSv = Get-Content $DatabaseFile -Raw
    $NewCSv += $MyCsvUser

    Set-Content -Value $NewCSv -Path $DatabaseFile
}
