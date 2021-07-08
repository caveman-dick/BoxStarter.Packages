Get-ChildItem $Boxstarter.LocalRepo | Remove-Item -Force -Recurse
New-BoxstarterPackage -Name DevMachineSetup -Path "$(Get-Location)\DevMachineSetup\" -quiet
New-BoxstarterPackage -Name MSSQL2014-Dev -Path "$(Get-Location)\MSSQL2014-Dev\"

Invoke-BoxStarterBuild -All
