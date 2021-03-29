Get-ChildItem $Boxstarter.LocalRepo | Remove-Item -Force -Recurse
New-BoxstarterPackage -Name DevMachineSetup -Path "$(Get-Location)\DevMachineSetup\" -quiet
New-BoxstarterPackage -Name TFPT2015 -Path "$(Get-Location)\TFPT2015\"

Invoke-BoxStarterBuild -All
