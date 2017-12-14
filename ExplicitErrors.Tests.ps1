using namespace System.Management.Automation
using module .\ExplicitErrors.psd1

Describe "ExplicitErrors Module Tests" {
    It "ErrorActionPreferece Set To SilentlyContinue" {
        $ErrorActionPreference | Should Be 'SilentlyContinue'
    }

    It "PSDefaultParameterValues Any -ErrorAction Defaults SilentlyContinue" {
        $PSDefaultParameterValues["*:ErrorAction"] | Should Be 'SilentlyContinue'
    }

    It "PSDefaultParameterValues Any -ErrorVariable Defaults ExErr" {
        $PSDefaultParameterValues["*:ErrorVariable"] | Should Be 'ExErr'
    }
}

Describe "New-ExErrRecord" {
    $Err = New-ExErrRecord -ErrorDescription "Oh Oh!" -ErrorId "Test 1" -ErrorCategory InvalidArgument -CallStack $(Get-PSCallStack) -ErrorAction SilentlyContinue
    It "ErrorRecord was created" {
        $Err | Should Not Be $null
    }

    It "ErrorRecord exception message" {
        $Err.Exception.Message | Should Be 'Oh Oh!'
    }
}