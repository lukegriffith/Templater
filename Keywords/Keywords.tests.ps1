
InModuleScope -ModuleName "Templater" {

    Describe "Template\Keywords" {
        
        Context "Template" {
        
            Mock Document {
                return [pscustomobject]@{
                    Title = "I am a file.txt"
                }
            }
            
            $Output = Template -Name "TestTemplate" -Items {
                
                Document
            }
            
            it 'Tempate should exist and contain a Document' {
                
                
                $Output | Should be $true
                
                $Output.Children | measure | % Count | should be 1
                
            }
            
        
            
            
        }
        
        
        Context "Directory" {
            
        }
        
        Context "Document" {
        
                   
        }
        
        Context "Parameter Binding" {
            
            Mock Document {
                
                [pscustomobject]@{
                    Name = $Name
                    Body = $Body
                } 
            }
            
                    
            $Output = Template -Name "ParameterBinding" -Items {
                
                Document -Name $DocumentName -Body "My content is $Content"
                
            } -TemplateParameters @{DocumentName="TestDocument";Content="Afternoon."}
            
            
            it 'Should have parameters bound.' {
                
                $Output.Children[0].Name | Should be "TestDocument"
                
                $Output.Children[0].Body | should be "My content is Afternoon."
                
            
            }
            
            
        }
        
    }
}