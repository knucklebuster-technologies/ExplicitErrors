$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "New-ErrorRecord" {
    $Err = New-ErrorRecord -ErrorDescription "Oh Oh!" -ErrorId "Test 1" -ErrorCategory InvalidArgument -CallStack $(Get-PSCallStack) -ErrorAction SilentlyContinue
    It "ErrorRecord was created" {
        $Err | Should Not Be $null
    }

    It "ErrorRecord exception message" {
        $Err.Exception.Message | Should Be 'Oh Oh!'
    }
}
