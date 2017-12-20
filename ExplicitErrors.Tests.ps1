using namespace System.Management.Automation

Import-Module .\ExplicitErrors.psd1 -Force

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
    $Err = New-ExErrRecord -Description "Oh Oh!" -Id "Test 1" -Category InvalidArgument -CallStack $(Get-PSCallStack) -ErrorAction SilentlyContinue
    It "ErrorRecord was created" {
        $Err | Should Not Be $null
    }

    It "ErrorRecord exception message" {
        $Err.Exception.Message | Should Be 'Oh Oh!'
    }
}