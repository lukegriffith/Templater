

$a = Template -Name "TestTemplate" -TemplateParameters @{ModuleName="TestModule";ModuleBody="function test {}"} -Items { 

    
    Directory -Name $ModuleName -Children { 



        Document -Name "$ModuleName.psm1" -Body $ModuleBody
    }


}