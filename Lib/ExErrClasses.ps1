using namespace System.Management.Automation

class ExErrRecord : ErrorRecord {
    [CallStackFrame[]]$CallStack = $null
}