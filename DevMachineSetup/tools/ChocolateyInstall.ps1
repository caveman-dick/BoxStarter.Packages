try 
{
    # Boxstarter options 
    $Boxstarter.RebootOk = $true # Allow reboots? 
    $Boxstarter.NoPassword = $false # Is this a machine with no login password? 
    $Boxstarter.AutoLogin = $true # Save my password securely and auto-login after a reboot 

    # Basic setup
    Update-ExecutionPolicy Unrestricted    
    Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
    Set-TaskbarSmall
    Enable-RemoteDesktop

    if (Test-PendingReboot) { Invoke-Reboot }

    Install-WindowsUpdate -AcceptEula
    
    if (Test-PendingReboot) { Invoke-Reboot }       

    #Essential Tools
    cinst -y 7zip
    cinst -y notepadplusplus.install     
    cinst -y vim
    cinst -y skype
    cinst -y conemu
    cinst -y windirstat
    cinst -y baretail
    cinst -y greenshot
    cinst -y cmder -pre
    cinst -y grepwin
    cinst -y RSA-SecurID

    #Browsers
    cinst -y firefox
    cinst -y google-chrome-x64
    
    #DevTools - Frameworks
    cinst -y DotNet3.5 
    cinst -y DotNet4.0 
    cinst -y DotNet4.5 
    cinst -y dotnet4.6
    cinst -y ruby
    cinst -y nodejs

    if (Test-PendingReboot) { Invoke-Reboot }
       
    #DevTools - Source Control
    cinst -y git
    cinst -y git-credential-winstore
    cinst -y sourcetree
    cinst -y gittfs    
    cinst -y poshgit
    cinst -y kdiff3
        
    # DevTools - IDE's
    cinst -y atom
    cinst -y linqpad4
    cinst -y mssql2014-dev
    cinst -y VisualStudio2015-Enterprise
    cinst -y tfpt2015

    if (Test-PendingReboot) { Invoke-Reboot }
    
    # DevTool - VS Extensions
    cinst -y  resharper
    Install-ChocolateyVsixPackage 'CodeMaid' 'https://visualstudiogallery.msdn.microsoft.com/76293c4d-8c16-4f4a-aee6-21f83a571496/file/9356/32/CodeMaid_v0.8.1.vsix'
    Install-ChocolateyVsixPackage 'VsVim' 'https://visualstudiogallery.msdn.microsoft.com/59ca71b3-a4a3-46ca-8fe1-0e90e3f79329/file/6390/57/VsVim.vsix'
    Install-ChocolateyVsixPackage 'ProductivityPowerTools' 'https://visualstudiogallery.msdn.microsoft.com/34ebc6a2-2777-421d-8914-e29c1dfa7f5d/file/169971/1/ProPowerTools.vsix'
    Install-ChocolateyVsixPackage 'ConEmuLauncher' 'https://visualstudiogallery.msdn.microsoft.com/1ce30e82-c27c-40fd-b2d8-310ab234ab74/file/91435/6/ConEmuLauncher.vsix'    
    Install-ChocolateyVsixPackage 'GitHubExtensionVisualStudio' 'https://visualstudiogallery.msdn.microsoft.com/75be44fb-0794-4391-8865-c3279527e97d/file/159055/11/GitHub.VisualStudio.vsix'    
    Install-ChocolateyVsixPackage 'ConEmuLauncher' 'https://visualstudiogallery.msdn.microsoft.com/1ce30e82-c27c-40fd-b2d8-310ab234ab74/file/91435/6/ConEmuLauncher.vsix'    
        
    #DevTools - Misc
    cinst -y nugetpackageexplorer
    cinst -y dotPeek
    cinst -y ilspy
    cinst -y fiddler4   
    cinst -y insted
    
    # Virtualisation        
    cinst -y virtualbox
    cinst -y virtualbox.extensionpack        
    cinst -y vagrant
    
    # SystemTools  
    cinst -y sysinternals
    cinst -y windbg
    (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
    
    #Windows installer
    cinst -y insted 

    Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"
    
    mkdir C:\source        

    Write-ChocolateySuccess 'Dev-Machine-Setup'
} 
catch 
{
    Write-ChocolateyFailure 'Dev-Machine-Setup' $($_.Exception.Message)
    throw
}
