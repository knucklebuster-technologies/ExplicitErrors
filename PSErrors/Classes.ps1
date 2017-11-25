Using namespace System.Management.Automation

#Base Errors Type for error handling and Tracking
# A very different design from Exception Catching
class PSErrors {
    hidden [string]$Message
    hidden [CallStackFrame[]]$CallStack
    hidden [PSErrors]$WrappedError = $null

    # Constructor create new instance of PSErrors
    # It stores the message passed to and it stores
    # a CallStack converted to a string. the CallStack
    # is created and stored at the location the PSErrors
    # object is created
    PSErrors([string]$message) {
        $this.CallStack = Get-PSCallStack
        $this.Message = $message
    }
    
    # Overloaded method that will return the Message
    # used to create the instance of PSErrors
    [string] ToString() {
        return $this.Message
    }
 
    # Returns the the CallStack
    # that was taken at the place the error occured
    # in your scripts
    [CallStackFrame[]] GetCallStack() {
        return $this.CallStack
    }

    # Regularly an eroor happening somewhere in script
    # can lead to code higher up the stack having an  
    # error condition. this allows you take the error
    # currently being handled and Wrap it with a newer
    # one if an error codition arises
    [void] WrapError([PSErrors]$error) {
        $this.WrappedError = $error
    }

    # returns either the PSErrors wrapped by
    # this PSErrors Object. If no PSErrors is 
    # wrapped we return null
    [PSErrors] GetWrappedError() {
        return $this.WrappedError
    }

    [string] GetErrorMessage() {
        return $this.Message
    }
 }
