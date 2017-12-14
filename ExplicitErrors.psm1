$moduleRoot = $PSScriptRoot

$ExportFunction = @()

Set-Variable -Name ErrorActionPreference -Value SilentlyContinue -Scope Global -Force
Set-Variable -Name PSDefaultParameterValues -Value @{"*:ErrorAction"='SilentlyContinue'; "*:ErrorVariable"='ExErr'} -Scope Global -Force

Get-ChildItem -Path "$moduleRoot\Lib" -Exclude "*Tests*" | ForEach-Object -Process {
    . $PSItem.FullName
}

$ExportFunction | ForEach-Object -Process {
    Export-ModuleMember -Function $PSItem
}