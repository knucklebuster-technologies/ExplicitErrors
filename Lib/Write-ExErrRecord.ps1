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
function Write-ExErrRecord {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, HelpMessage='The ErrorRecord to be added')]
        [ValidateNotNullOrEmpty()]
        [ErrorRecord]
        $ErrorRecord,
        [Parameter(Mandatory=$true, ParameterSetName='Text')]
        [Parameter(Mandatory=$true, ParameterSetName='XML')]
        [Parameter(Mandatory=$true, ParameterSetName='JSON')]
        [ValidateScript({ Test-Path -Path $PSItem })]
        [string]
        $Path,
        [Parameter(Mandatory=$true, ParameterSetName='Text')]
        [Parameter(Mandatory=$true, ParameterSetName='XML')]
        [Parameter(Mandatory=$true, ParameterSetName='JSON')]
        [string]
        $Name,
        [Parameter(Mandatory=$true, ParameterSetName='Text')]
        [switch]
        $Text,
        [Parameter(Mandatory=$true, ParameterSetName='XML')]
        [switch]
        $XML,
        [Parameter(Mandatory=$true, ParameterSetName='JSON')]
        [switch]
        $JSON
    )
    
    process {
        switch ($PSCmdlet.ParameterSetName) {
            'Text' {}
            'XML' {}
            'JSON' {}
            Default {
                $PSItem | Write-Error
            }
        }
    }
}

$ExportFunction+='Write-ExErrRecord'