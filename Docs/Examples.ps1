. "C:\work\github\PowerShell\PSHandlingErrors\PSErrors\Classes.ps1"

function Invoke-ExplicitErrors {
    [OutputType([int], [PSErrors])]
    param (
        $Message
    )

    if($Message -eq "") {
        return "", (New-PSErrorsInstance -Message "Parameter was empty string")
    }
    return $Message, $null
}

$msg, $err = Invoke-ExplicitErrors -Message ""
if($err -ne $null) {
    # errors are usually either
    # 1. passed up the chain of calls
    # 2. used to return early from execution
    # 3. attempt some kind of recovery
    $err.GetErrorMessage()
}
return $msg