
function Template {

    param(
        [String]$Name,
        [Hashtable]$TemplateParameters,
        [ScriptBlock]$rootItem
    )
    
    if ($PSBoundParameters.ContainsKey("TemplateParameters")) {

        $list = [System.Collections.Generic.List[psvariable]]::new()
        $TemplateParameters.Keys | ForEach-Object {
            Set-Variable -Name $_ -Value $TemplateParameters[$_]
            $list.Add([psvariable]::new($_, $TemplateParameters[$_]))


            
        }
        [psTemplater]::Params = $list
    }
    
    $Param = @{DisableParam = ($DisableAutoInjectParameters.IsPresent)}  


    [pscustomobject]@{
        
        Type = "Template"
        Name = $Name
        TemplateParameters = $TemplateParameters
        Children = InvokeChild -Child $rootItem @Param
        
    }

    # Need to validate that Template can only have 1 child, either a file or a directory. 


}


function InvokeChild {
    param(
        [Object]$Child,
        [switch]$DisableParam
    )

    if ($DisableParam.IsPresent) {
        $Child.Invoke()
    }
    else {
        $Child.InvokeWithContext($null,[psTemplater]::Params)
    }

}


function Directory {
    
    param(
        [String]$Name,
        [ScriptBlock]$Children,
        [Parameter(ParameterSetName="DisableParameterBinding")]
        [Switch]$DisableAutoInjectParameters
    )

    $Param = @{DisableParam = ($DisableAutoInjectParameters.IsPresent)}  
    
    return [PSCustomObject]@{
        Type = "Directory"
        Name = $Name
        Children = InvokeChild -Child $Children @Param
    }
    
    
}

function Document {
    [cmdletbinding(DefaultParameterSetName="ParameterBinding")]
    param(
        [String]$Name,
        [String]$Body,
        [Parameter(ParameterSetName="DisableParameterBinding")]
        [Switch]$DisableAutoInjectParameters,
        [Hashtable]$Parameters
    )
    
    
    return [PSCustomObject]@{
        Type = "Document"
        Name = $Name
        Body = $Body
    }
    
    
}