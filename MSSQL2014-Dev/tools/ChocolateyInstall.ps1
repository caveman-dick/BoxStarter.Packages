try 
{
    Enable-WindowsOptionalFeature -FeatureName:NetFx3 -Online -All
    imdisk -a -f '\\software.adastra.co.uk\install\SQL 2014\en_sql_server_2014_developer_edition_x64_dvd_3940406.iso' -m "w:"
    Install-ChocolateyInstallPackage 'MSSQL2014-Dev' 'exe' '/ACTION=Install /IACCEPTSQLSERVERLICENSETERMS /SQLSYSADMINACCOUNTS="ADASTRA\Developers" /QS /FEATURES=SQL,Tools /InstanceName=MSSQLSERVER /SECURITYMODE=SQL /SAPWD=Transm1t' 'w:\Setup.exe'
    imdisk -D -m w:
    Write-ChocolateySuccess 'MSSQL2014-Dev'
} 
catch 
{
    Write-ChocolateyFailure 'MSSQL2014-Dev' $($_.Exception.Message)
    throw
}