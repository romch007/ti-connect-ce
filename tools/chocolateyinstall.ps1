
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://education.ti.com/download/en/ed-tech/13312F7CEC074A2DAFD7EE5646129839/F3101FA52CF64929B219B7179673CDA1/TIConnectCE-5.4.0.1181.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url

  softwareName  = 'ti-connect-ce*'

  checksum      = 'A0F9CD88E2E1B4C914C5E107D7ED9490A7CD287E3E47DE4DD93B8D2DA060BA7F'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








