. $PSScriptRoot\psTemplater.ps1
[psTemplater]::root = $PSScriptRoot

Get-ChildItem -Path $PSScriptRoot\Functions, $PSScriptRoot\Keywords -Exclude "*tests.ps1" -Recurse | ForEach-Object {
    . $_.FullName
}

