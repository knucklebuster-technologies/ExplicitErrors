# ExplicitErrors
Set of functions, tools, examples, guidelines of using explicit error handling in PSH.

Explicit error handling is the practice of detecting an error an taking action. Where exception handling is the pratice of waiting until something wrong happens and then taking action. Systems like node.js and google golang use this type of handling errors. Go (golang) does by any function call that could encounter an error condition should return an error as its last return value, go allows multiple values to return from a function call.

Powershell supports this type of error handling and it's even part of the core cmdlet.
1. ErrorAction common cmdlet param
2. ErrorVarible common cmdlet param

These 2 parameters are available on any cmdlet or function that has the CmdletBinding attribute. Heres an example of how you can use these to handle the error.
```powershell
$proc = Get-Process -ErrorAction SilentlyContinue -ErrorVariable 'Err'
if ($Err -ne $null) {
    # Handle the error you might log it and continue, return error to caller, or exit
}
$proc | Out-List
```
Powershell also allows us to return multiple results from our functions. We could write a function as so
```powershell
function Invoke-MyTask {
    [OutputType([MyTask[]])]
    [OutputType([ErrorRecord])]

    param (
        [string]$ComputerName
    )

    # If script errors return a $null for the MyTask array and a value for the ErrorRecords
    if (Test-Connection -ComputerName $ComputerName -Quiet -ne $true) {
        return $null, $err
    }

    # If script completes return a value for the MyTask array and a $null for the ErrorRecord
    return $tasks, $null
}
```