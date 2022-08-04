
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://education.ti.com/download/en/ed-tech/13312F7CEC074A2DAFD7EE5646129839/E83C88A7C19B4D0C87429F5C1CDDD4D6/TIConnectCE-6.0.0.2688.msi'

Start-ChocolateyProcessAsAdmin "certutil -addstore 'TrustedPublisher' '$toolsDir\texas.cer'"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url

  softwareName  = 'ti-connect-ce*'

  checksum      = 'F20F433ED9978055C531E8737A74EFD45A5622B48C72C7EA3C57D57F2AD90B02'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
