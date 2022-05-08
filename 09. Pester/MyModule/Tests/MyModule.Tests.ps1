Remove-Module -Name 'MyModule' -ErrorAction SilentlyContinue
Import-Module $PSScriptRoot\..\MyModule\

Describe 'Add-CourseUser' {
    BeforeAll {
        Mock -CommandName 'Set-Content' -ModuleName MyModule -MockWith {
            Return "works!"
        }
    }
    Context 'Verifying names - Lab 1' {
        It 'Jason Derülo should work' {
            Add-CourseUser -Age 42 -Color red -UserID 666 -Name 'Jason Derülo' | Should -be 'works!'
        }
        It 'Björn Skifs should work' {
            Add-CourseUser -Age 42 -Color red -UserID 666 -Name 'Björn Skifs' | Should -be 'works!'
        }
        It 'Will.i.am should work' {
            Add-CourseUser -Age 42 -Color red -UserID 666 -Name 'Will.i.am' | Should -be 'works!'
        }
        It 'Sinéad O´Connor should work' {
            Add-CourseUser -Age 42 -Color red -UserID 666 -Name 'Sinéad O´Connor' | Should -be 'works!'
        }
    }
    
    Context 'Verifying names - Lab 2 - Testcases' {
        $TestCases = @(
            'Jason Derülo'
            'Björn Skifs'
            'Will.i.am'
            'Sinéad O´Connor'
        )

        It '<_> should work' -TestCases $TestCases {
            Add-CourseUser -Age 42 -Color red -UserID 666 -Name $_ | Should -be 'works!'
        }
    }
}

Describe 'Get-CourseUser' {
    Context 'Parameters should work as expected' {
        It 'Should throw an error if both the name and olderthan parameter is set' {
            {Get-CourseUser -Name 'Name' -OlderThan 42} | Should -Throw
        }
        It 'Should not throw an error if only the name parameter is set' {
            {Get-CourseUser -Name 'Name'} | Should -Not -Throw
        }
        It 'Should not throw an error if only the OlderThan parameter is set' {
            {Get-CourseUser -OlderThan 42} | Should -Not -Throw
        }
    }
}