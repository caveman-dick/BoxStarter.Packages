Get-ChildItem $Boxstarter.LocalRepo | Remove-Item -Force -Recurse
New-BoxstarterPackage -Name DevMachineSetup -Path "$(Get-Location)\DevMachineSetup\" -quiet
New-BoxstarterPackage -Name MSSQL2014-Dev -Path "$(Get-Location)\MSSQL2014-Dev\"
New-BoxstarterPackage -Name TFPT2015 -Path "$(Get-Location)\TFPT2015\"

Invoke-BoxStarterBuild -All
