# Boxstarter Packages

My Boxstarter packages. These are used to quickly get my dev machine up and running after a OS re-install.

## BoxStarter New Machine Installation Notes

Here is a link to all the docs for BoxStarter: [Why BoxStarter](http://boxstarter.org/WhyBoxstarter)

The following summarises what I did.

### Setup

You can either run the `1.Setup.ps1` script as admin or manually install BoxStarter: [Install BoxStarter](http://boxstarter.org/InstallBoxstarter)

### Checkout Existing BoxStarter Script

Fork this Git repository (Boxstarter.Packages) - fork into your own repository so that you can commit any changes you make.

Edit the ChocolatelyInstall.ps1 to suit your needs (found under DevMachineSetup/tools)

### Creating BoxStarter Packages

Run the `2.BuildPackages.ps1` to build the package

### Install the boxstarter package

Installing the package will also run all the commands in your `ChocolateyInstall.ps1` so this will take a while. Run the `3.Install.ps1` to kick it all off.