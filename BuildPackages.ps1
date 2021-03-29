Get-ChildItem $Boxstarter.LocalRepo | Remove-Item -Force -Recurse
New-BoxstarterPackage -Name DevMachineSetup -Path "$(Get-Location)\DevMachineSetup\" -quiet

Invoke-BoxStarterBuild -All
