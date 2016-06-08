function Invoke-Template {

    param(
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [String]$Name,
        [String]$Path = "."
    )

    $pathToTemplate = "$([psTemplater]::root)\Templates\$Name"

    $scriptParams = Get-Command $pathToTemplate

    $parameters = ProcessParameters $scriptParams

    $splat = BuildParameters $parameters
    
    $template = & $pathToTemplate @splat

    FlushTemplate -Template $template -Target $Path
    
}

function Get-Templates {

    Get-ChildItem -Path "$([psTemplater]::root)\Templates"
}


<#

    Can get help message
    $a.Parameters["ModuleName"].Attributes.HelpMessage



#>

function ProcessParameters {
    param($Params)


    $DefaultParams = @("ErrorAction","WarningAction","InformationAction","Verbose","Debug","ErrorVariable","WarningVariable","InformationVariable","OutVariable","OutBuffer","PipelineVariable")

    $return = @{}
    $Params.keys | Where-Object {$_ -notin $DefaultParams} | ForEach-Object { $return[$_] = $Params[$_] }  

    return $return
}

function BuildParameters {
    param(
        $Parameters
    )

    <#
        Need to build parameters via read-host. --- not this one
        OR 
        Enter nester host and tell user to set $Variables or use cmdlets and classes to interact with the tempalter.

        and look to move implementation to dynamicparameters or tabexpansion also.

        Thinking automated templating, and user experience templating.

        



    #>


}