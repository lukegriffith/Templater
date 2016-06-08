 Param(
     [Parameter(HelpMessage="name for module.")]
     [string]$ModuleName,
     [Parameter(HelpMessage="Body of module.")]
     [string]$ModuleBody
 )
 
 Template -Name $ModuleName -rootItem { 

    
    Directory -Name $ModuleName -Children { 

        Directory -DisableAutoInjectParameters -Name "Testing" -Children {

            Document -Name "Test$ModuleName.psm1" -Body (@"
This is my {0} here.
"@ -f "Body")
        } 


        Document -Name "$ModuleName.psm1" -Body $ModuleBody
    }


}
