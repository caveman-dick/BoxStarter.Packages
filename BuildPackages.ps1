Get-ChildItem $Boxstarter.LocalRepo | Remove-Item -Force -Recurse
New-BoxstarterPackage -Name DevMachineSetup -Path "$(Get-Location)\DevMachineSetup\" -quiet
New-BoxstarterPackage -Name MSSQL2014-Dev -Path "$(Get-Location)\MSSQL2014-Dev\"
New-BoxstarterPackage -Name TFPT2015 -Path "$(Get-Location)\TFPT2015\"
New-BoxstarterPackage -Name VisualStudio2015-Enterprise -Path "$(Get-Location)\VisualStudio2015-Enterprise\"
New-BoxstarterPackage -Name RSA-SecurID -Path "$(Get-Location)\RSA-SecurID\"

Invoke-BoxStarterBuild -All
