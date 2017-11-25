$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "PSErrors Class" {
    It "Constructor" {
        $err = [PSErrors]::New("Testing Constructor")
        $err.GetType().FullName -eq "PSErrors" | Should Be $true
    }
}
