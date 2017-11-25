
<#
    .SYNOPSIS
        Returns a new instaace of [PSErrors] Type
    .DESCRIPTION
        Takes an error message that provides context
        and \ or the root cause of the error. The new
        PSErrors object also contains the current CallStack
        at the place that the new object was created.
    .EXAMPLE
        PS C:\> New-PSErrorsInstance -ErrorMessage "The script failed to execute the application"
        Returns a new instance of [PSErrors] that includes
        the message and \ or context of the errors root cause and
        It also has CallStack in string that was taken at location
        the PSErrors was created.
    .NOTES
        General notes
    #>
    function New-PSErrorsInstance {
        [CmdletBinding()]
        [OutputType([PSErrors])]
       param(
           [Parameter(ValueFromPipeline=$true, Mandatory=$true, HelpMessage="a string message describing the error context and / or cause")]
           [string]
           $Message
       )
   
       [PSErrors]::New($Message)
    }
