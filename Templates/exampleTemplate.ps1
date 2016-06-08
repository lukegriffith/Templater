 Template -Name "TestTemplate" -TemplateParameters @{ModuleName="TestModule";ModuleBody="function test {}"} -rootItem { 

    
    Directory -Name $ModuleName -Children { 

        Directory -DisableAutoInjectParameters -Name "Testing" -Children {

            Document -Name "Test$ModuleName.psm1" -Body (@"
This is my {0} here.
"@ -f "Body")
        } 


        Document -Name "$ModuleName.psm1" -Body $ModuleBody
    }


}
