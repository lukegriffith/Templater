function Template {

    param(
        [String]$Name,
        [Hashtable]$TemplateParameters,
        [ScriptBlock]$Items
    )
    
    if ($PSBoundParameters.ContainsKey("TemplateParameters")) {
        $TemplateParameters.Keys | ForEach-Object {
            Set-Variable -Name $_ -Value $TemplateParameters[$_]
        }
    }
    
    [pscustomobject]@{
        
        Type = "Template"
        Name = $Name
        TemplateParameters = $TemplateParameters
        Children = $Items.Invoke()
        
    }

}

function Directory {
    
    param(
        [String]$Name,
        [ScriptBlock]$Children
    )
    
    return [PSCustomObject]@{
        Type = "Directory"
        Name = $Name
        Children = $Children.Invoke()
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