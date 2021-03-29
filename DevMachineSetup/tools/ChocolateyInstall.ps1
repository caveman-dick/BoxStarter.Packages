try 
{
    # Boxstarter options 
    $Boxstarter.RebootOk = $true # Allow reboots? 
    $Boxstarter.NoPassword = $false # Is this a machine with no login password? 
    $Boxstarter.AutoLogin = $true # Save my password securely and auto-login after a reboot

    choco feature enable -n allowGlobalConfirmation

    # Basic setup
    Update-ExecutionPolicy Unrestricted    
    Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -EnableOpenFileExplorerToQuickAccess -EnableShowRecentFilesInQuickAccess -EnableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder -EnableShowRibbon
    Set-BoxstarterTaskbarOptions -Size Large -Dock Bottom -AlwaysShowIconsOn
    Disable-InternetExplorerESC
    Disable-GameBarTips
    Enable-RemoteDesktop

    # Language setup
    $LanguageList = Get-WinUserLanguageList;
    $LanguageList.Add("en-GB");
    $LanguageList.Add("en-US");
    Set-WinUserLanguageList $LanguageList

    if (Test-PendingReboot) { Invoke-Reboot }

    Install-WindowsUpdate -AcceptEula
    
    if (Test-PendingReboot) { Invoke-Reboot }       

    # Essential Tools
    choco install 7zip    
    choco install conemu
    choco install windirstat
    choco install baretail
    choco install greenshot
    choco install grepwin

    # Text Editors
    choco install vscode
    choco install notepadplusplus
    choco install vim

    # Browsers
    choco install firefox
    choco install google-chrome-x64
    choco install opera
    
    # DevTools - Frameworks
    choco install dotnet
    choco install dotnet4.6    
    choco install nodejs

    if (Test-PendingReboot) { Invoke-Reboot }
       
    #DevTools - Source Control
    choco install git
    choco install git-credential-manager-for-windows
    choco install sourcetree
    choco install poshgit
    choco install p4merge
        
    # DevTools - IDE's    
    choco install jetbrainstoolbox
    choco install linqpad6

    if (Test-PendingReboot) { Invoke-Reboot }
    
    # DevTools - Misc
    choco install nugetpackageexplorer
    choco install fiddler
    
    # Virtualisation              
    Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Containers
    Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Hyper-V-All
    Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName VirtualMachinePlatform
    Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux
    if (Test-PendingReboot) { Invoke-Reboot }
    choco install wsl-ubuntu-2004
    wsl --set-default-version 2
    choco install vagrant
    choco install docker-desktop

    # IIS
    Enable-WindowsOptionalFeature -Online -All -NoRestart -FeatureName IIS-ASPNET45
    
    # SystemTools  
    choco install sysinternals
    choco install windbg
    (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

    mkdir C:\source        

    Write-ChocolateySuccess 'Dev-Machine-Setup'
} 
catch 
{
    throw $_.Exception
}
