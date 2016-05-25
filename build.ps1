
Task -name "Test" -action {


    #Import-Module $PSScriptRoot\Templater.psm1
    Set-Location $PSScriptRoot;
    $pOut = Invoke-Pester -passthru
    
    if ($pOut.FailedCount -gt 0) {
        Write-Error "Unit testing failed."
    }
    
}