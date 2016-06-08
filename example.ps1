
ipmo $PSScriptRoot\ModuleLoader.psm1

Start-Transcript -Path C:\temp\tempbindingtrans.txt -Append

#Trace-Command -Expression {

# Currently DisableAutoInjectParameters switch does not work. 


$a = Template -Name "TestTemplate" -TemplateParameters @{ModuleName="TestModule";ModuleBody="function test {}"} -rootItem { 

    
    Directory -Name $ModuleName -Children { 

        Directory -DisableAutoInjectParameters -Name "Testing" -Children {

            Document -Name "Test$ModuleName.psm1" -Body (@"
This is my {0} here.
"@ -f "Body")
        } 


        Document -Name "$ModuleName.psm1" -Body $ModuleBody
    }


}

$A

#} -Name ParameterBinderController -Verbose -PSHost

#Stop-Transcript