Task Default -depends "Unit", "Acceptance"


Task -Name PreDeploy -action { 

    ni -it j -Path "$env:USERPROFILE\Documents\WindowsPowerShell\Modules\Templater" -Value $PSScriptRoot

}


Task -name Unit -action {

    ipmo Templater
    Set-Location $PSScriptRoot;
    $pOut = Invoke-Pester -passthru
    
    if ($pOut.FailedCount -gt 0) {
        Write-Error "Unit testing failed."
    }
    
}

Task -name Acceptance -action {

    pushd
    cd $PSScriptRoot\Artifacts 

    Invoke-Template -Name exampleTemplate.ps1





}