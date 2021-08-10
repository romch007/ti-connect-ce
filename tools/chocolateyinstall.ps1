
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://education.ti.com/download/en/ed-tech/13312F7CEC074A2DAFD7EE5646129839/A01980B6930343518F9014853089FA71/TIConnectCE-5.6.3.2278.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url

  softwareName  = 'ti-connect-ce*'

  checksum      = '0A9D8F9D42D89B2A6CE6B33C49019E1B24408BC47394B6B2AB56AF1E350ABAEA'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
