@echo off

powershell -NoProfile -ExecutionPolicy bypass -command ". %~dp01.Setup.ps1"
powershell -NoProfile -ExecutionPolicy bypass -command ". %~dp02.BuildPackages.ps1"
powershell -NoProfile -ExecutionPolicy bypass -command ". %~dp03.Install.ps1"
