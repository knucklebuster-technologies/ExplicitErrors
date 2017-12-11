using namespace System.Management.Automation

function Write-ErrorRecord {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [ErrorRecord]
        $ErrorRecord
    )
    
    begin {
    }
    
    process {
    }
    
    end {
    }
}