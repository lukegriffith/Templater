function FlushTemplate {
    param (
        [Object]$Template,
        [String]$Target
    )
    
    $item = $Template
    
    do {
        
        switch ($item) {
            
            {$item.type -eq "Template" } {
                
                
            }
            
        }
        
        
        
    }
    until ($null -eq $item)
    
    
    
}

function HasChildren {
    
    param($object)
    
    return -not $null -eq $object.children    
}


function RecurseObject {
    
    param(
        $object
    )
    
    
}