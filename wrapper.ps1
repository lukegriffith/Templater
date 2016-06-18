
if (-not (Get-Module -ListAvailable -Name psake -ea SilentlyContinue )) {

    Install-Module psake
} else {
    Import-Module psake
}

Invoke-psake -buildFile $PSScriptRoot\build.ps1