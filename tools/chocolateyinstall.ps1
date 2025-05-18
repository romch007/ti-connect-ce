
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://education.ti.com/download/en/ed-tech/13312F7CEC074A2DAFD7EE5646129839/70AE969131CF46EBB26D30843B2F9C13/TIConnectCE-6.0.3.619.msi'

Start-ChocolateyProcessAsAdmin "certutil -addstore 'TrustedPublisher' '$toolsDir\texas.cer'"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir	
  fileType      = 'msi'
  url           = $url

  softwareName  = 'ti-connect-ce*'

  checksum      = '7B43979F6FB5F5B0DA0FB670A0E021B609D02DD3E171C7D71AC8B1B3657C34D6'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
