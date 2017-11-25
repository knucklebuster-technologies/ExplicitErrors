$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"
. "$here\Classes.ps1"

Describe "New-PSErrorsInstance" {
    It "Function returns a valid PSErrors object" {
        $err = New-PSErrorsInstance -Message "Testing a function"
        $err.GetType().FullName -eq "PSErrors" | Should Be $true
    }
}
