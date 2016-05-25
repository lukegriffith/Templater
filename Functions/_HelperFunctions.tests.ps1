Describe "Templater\_HelperFunctions" {
    
    Context "FlushTemplate" {
    
       
    }
    
    
    Context "RecurseObject" {
        
        
        
        
        
    }
    
    Context "HasChildren" {
        
        $obj = [pscustomobject]@{
            Children = [pscustomobject]@{blah=1}
        }
        
        it 'Object has children' { 
        
            HasChildren $obj | Should be $true
        }
        
        $obj = [pscustomobject]@{
            Children = $null
        }
        
        it 'Object does not have children' {
            
            HasChildren $obj | should be $false
            
        }
        
        
    }
    
    
    
}