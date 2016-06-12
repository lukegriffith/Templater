

InModuleScope -ModuleName "Templater" {

    Describe "Template\Keywords" {
        
        Context "Template" {
        
            Mock Document {
                return [pscustomobject]@{
                    Title = "I am a file.txt"
                }
            }
            
            $Output = Template -Name "TestTemplate" -rootItem {
                
                Document
            }
            
            it 'Tempate should exist and contain a Document' {
                
                $Output | Should be $true
                $Output.Children | measure | % Count | should be 1
                
            }
            
        
            
            
        }
        
        
        Context "Directory" {
            
            Mock Document {
                return [pscustomobject]@{
                    Title = "I am a file.txt"
                }
            }
            
            $output = Directory -name "MyDir" -Children {
                Document  
            }
            
            
            it 'Directory containg a document' {
                
                $output.Type | should be "Directory"
                $output.Name | should be "MyDir"
                $output.Children[0].Title | should be "I am a file.txt"
            }
            
        }
        
        Context "Document" {
        
        
            $output = Document -Name "MyDocument" -Body "This is my Body" 
               
            it 'Outputs a document object' {
                
                $output.Type | should be "Document"
                $output.Name | should be "MyDocument"
                $output.Body | should be "This is my Body"
                
            }
        
                   
        }
        
        Context "Parameter Binding" {
            
            Mock Document {
                
                [pscustomobject]@{
                    Name = $Name
                    Body = $Body
                } 
            }
            
                    
            $Output = Template -Name "ParameterBinding" -rootItem {
                
                Document -Name $DocumentName -Body "My content is $Content"
                
            } -TemplateParameters @{DocumentName="TestDocument";Content="Afternoon."}
            
            
            it 'Should have parameters bound.' {
                
                $Output.Children[0].Name | Should be "TestDocument"
                
                $Output.Children[0].Body | should be "My content is Afternoon."
                
            
            }
            
            
        }
        
    }
}