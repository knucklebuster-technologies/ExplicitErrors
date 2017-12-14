using namespace System.Management.Automation

<#
.SYNOPSIS
    Creates and returns an ExErrRecord object to using in explicit error checking. 
.DESCRIPTION
    Creates and returns an ExErrRecord object to using in explicit error checking.
    The object returned is ExErrRecord a custom class defined in this module.
    ExErrRecord extends System.Management.Automation.ErrorRecord with one property
    CallStack. The CallStack property is of type System.Management.Automation.CallStack[].
    The CallStack is expected to be the return from the command Get-PSCallStack.
.EXAMPLE
    PS C:\> $Err = New-ExErrRecord -Description "Oh Oh!" -Id "Test 1" -Category InvalidArgument -CallStack $(Get-PSCallStack) $Err = New-ExErrRecord -ErrorDescription "Oh Oh!" -ErrorId "Test 1" -ErrorCategory InvalidArgument -CallStack $(Get-PSCallStack) -ErrorAction SilentlyContinue -ErrorVariable $ExErr
    This will create a new ExErrRecord that could be used to return from a function to signal
    an error condition.
.OUTPUTS
    [ExErrRecord]
.NOTES
    Part of Explicit Error Experiment
#>
function New-ExErrRecord {
    [CmdletBinding()]
    [OutputType([ExErrRecord])]
    Param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage="Provide an Error Description or an Exception")]
        [string]
        $Description,
        [Parameter(Mandatory=$true, HelpMessage="Provide a string to uniquely identify this error")]
        [string]
        $Id,
        [Parameter(Mandatory=$true, HelpMessage="Provide the category that best matches error")]
        [ErrorCategory]
        $Category,
        [Parameter(Mandatory=$false, HelpMessage="Provide the output of the Get-CallStack command")]
        [CallStackFrame[]]
        $CallStack,
        [Parameter(Mandatory=$false, HelpMessage="Option to provide the object being processed when error occured")]
        [Object]
        $TargetObject 
    )

    Begin {}

    Process {
        $ex = [Exception]::new($Description)
        $err = [ExErrRecord]::new($ex, $Id, $Category, $TargetObject)
        $err.CallStack = $CallStack
        $err
    }

    End {}
}

$ExportFunction+='New-ExErrRecord'