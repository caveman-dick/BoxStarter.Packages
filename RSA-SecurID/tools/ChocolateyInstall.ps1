try 
{
	$tempDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
    Install-ChocolateyZipPackage `
        -packageName 'RSA-SecurID' `
        -url 'ftp://ftp.emc.com/pub/agents/x86/RSASecurIDToken500.zip' `
        -unzipLocation  $tempDir `
        -url64bit 'ftp://ftp.emc.com/pub/agents/x64/RSASecurIDToken500.zip'

    # For some reason the unzip renames the msi to exe. Fixing that...
    mv "$tempDir\RSA-SecurIDInstall.exe" "$tempDir\RSA-SecurIDInstall.msi"

    Install-ChocolateyPackage `
        -packageName 'RSA-SecurID' `
        -installerType 'msi' `
        -silentArgs '/quiet' `
        -url "$tempDir\RSA-SecurIDInstall.msi" `
        -url64bit "$tempDir\RSA-SecurIDInstall.msi"        
           
    Write-ChocolateySuccess 'RSA-SecurID'
} 
catch 
{
    Write-ChocolateyFailure 'RSA-SecurID' $($_.Exception.Message)
    throw
}