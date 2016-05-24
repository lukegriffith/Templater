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
        
        Name = $Name
        TemplateParameters = $TemplateParameters
        Children = $Items.Invoke()
        
    }

}

function Directory {
    
    param(
        [String]$Name,
        [ScrptBlock]$Children
    )
    
    
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
    
}