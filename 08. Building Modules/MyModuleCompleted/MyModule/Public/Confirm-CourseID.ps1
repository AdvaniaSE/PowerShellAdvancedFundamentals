function Confirm-CourseID {
    Param()

    $AllUsers = GetUserData

    foreach ($User in $AllUsers) {
        if ($User.Id -notmatch '^\d+$') {
            Write-Error "User $($User.Name) has mismatching id: $($User.Id)"
        }
    }
}
