$moduleRoot = $PSScriptRoot

Set-Variable -Name ErrorActionPreference -Value SilentlyContinue -Scope Global -Force
Set-Variable -Name PSDefaultParameterValues -Value @{"*:ErrorAction"='SilentlyContinue'; "*:ErrorVariables"='ExErr'} -Scope Global -Force

. "$ModuleRoot\Lib\New-ExErrRecord"

Export-ModuleMember -Function "New-ExErrRecord"