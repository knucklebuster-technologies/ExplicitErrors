using namespace System.Management.Automation

<#
.SYNOPSIS
    Short description
.DESCRIPTION
    Long description
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
function New-ExErrRecord {
    [CmdletBinding()]
    [OutputType([ErrorRecord])]
    Param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage="Provide an Error Description or an Exception")]
        [Exception]
        $ErrorDescription,
        [Parameter(Mandatory=$true, HelpMessage="Provide a string to uniquely identify this error")]
        [string]
        $ErrorId,
        [Parameter(Mandatory=$true, HelpMessage="Provide the category that best matches error")]
        [ErrorCategory]
        $ErrorCategory,
        [Parameter(Mandatory=$false, HelpMessage="Provide the output of the Get-CallStack command")]
        [CallStackFrame[]]
        $CallStack,
        [Parameter(Mandatory=$false, HelpMessage="Option to provide the object being processed when error occured")]
        [Object]
        $TargetObject 
    )

    Begin {}

    Process {
        $err = New-Object -TypeName 'ErrorRecord' -ArgumentList $ErrorDescription, $ErrorId, $ErrorCategory, $TargetObject
        $err | Add-Member -MemberType NoteProperty -Name "CallStack" -Value $CallStack -Force 
        $err.CallStack = $CallStack
        $err
    }

    End {}
}

$ExportFunction+='New-ExErrRecord'