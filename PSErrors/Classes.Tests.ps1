$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "PSErrors Class" {
    It "Constructor creates valid object type" {
        $err = [PSErrors]::New("Testing Constructor")
        $err.GetType().FullName -eq "PSErrors" | Should Be $true
    }

    It "ToString method should return the message used to construct object" {
        $msg = "Testing ToString Method"
        $err = [PSErrors]::New($msg)
        $err.ToString() -eq $msg | Should Be $true
    }

    It "GetCallStack method should not be null" {
        $msg = "Testing GetCallStack method"
        $err = [PSErrors]::New($msg)
        $err.GetCallStack() -ne $null | Should Be $true 
    }

    It "WrapError method should store previous error without exception" {
        $msg = "Testing WrapError method (previous error)"
        $err = [PSErrors]::New($msg)
        $msg1 = "Testing WrapError method (current error)"
        $err1 = [PSErrors]::New($msg1)
        { $err1.WrapError($err) } | Should Not Throw
    }

    It "GetWrappedError method should not return null" {
        $msg = "Testing GetWrappedError method (previous error)"
        $err = [PSErrors]::New($msg)
        $msg1 = "Testing GetWrappedError method (current error)"
        $err1 = [PSErrors]::New($msg1)
        $err1.WrapError($err)
        $err1.GetWrappedError() -ne $null | Should Be $true 
    }

    It "GetWrappedError method should return null" {
        $msg = "Testing GetWrappedError method (previous error)"
        $err = [PSErrors]::New($msg)
        $err.GetWrappedError() -eq $null | Should Be $true 
    }
}
