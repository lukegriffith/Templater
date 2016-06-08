function Invoke-Template {

    param(
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        $Name,
        $Path = "."
    )

    $pathToTemplate = "$([psTemplater]::root)\Templates\$Name"

    $template = & $pathToTemplate

    FlushTemplate -Template $template -Target $Path
    
}

function Get-Templates {

    Get-ChildItem -Path "$([psTemplater]::root)\Templates"
}