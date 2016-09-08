Boxstarter Packages
===================

My Boxstarter packages. These are used to quickly get my dev machine up and running after a OS re-install.

BoxStarter New Machine Installation Notes
=============================================
Here is a link to all the docs for BoxStarter:  http://boxstarter.org/WhyBoxstarter

The following summarises what I did.

Install BoxStarter
-------------------
http://boxstarter.org/InstallBoxstarter

Checkout Existing BoxStarter Script
------------------------------------
Fork this Git repository (Boxstarter.Packages) - fork into your own repository so that you can commit any changes you make.
(You'll have to install git first)
It can be found here: http://git.dev.ahc/mayesr/Boxstarter.Packages

Edit the ChocolatelyInstall.ps1 to suit your needs (found under DevMachineSetup/tools)

Creating BoxStarter Packages
-------------------------------
Open the BoxStarter command prompt (To access the BoxStarter shell type "BoxStarterShell" at an admin PowerShell command prompt (note BoxStarterShell NOT BoxStarter))

Run the following command:

```New-BoxstarterPackage -Name DevMachineSetup -Description "DevMachineSetup" -Path "c:\somePath"``` 

where somePath contains the ChocolatelyInstall.ps1 file.

Install a boxstarter package to your local BoxStarter repository
-----------------------------------------------------------------

To build the packages to *.nupkg files and install into $Boxstarter.LocalRepo call:
```Invoke-BoxStarterBuild MyPackage```

For the following packages and anything else you have manually created in the step above:
* DevMachineSetup
* MSSQL2014-Dev
* TFPT2015
* VisualStudio2015-Enterprise 
* ~~RSA-SecurID~~ (not currently working so install manually).


Run the Package to install
---------------------------
Install-BoxstarterPackage -PackageName DevMachineSetup

When I ran this the install of vim was not successful  From the logs -- Gateway Anti-Virus Alert using https://sourceforge.net/projects/cream/files/Vim/7.4.1641/gvim-7-4-1641.exe/download
The install of cmder was not successful - appeared to be a Checksum mismatch from the logs.  So you will probably have to install these manually to unless you change the source.
