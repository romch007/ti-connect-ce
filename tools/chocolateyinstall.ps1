
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://education.ti.com/download/en/ed-tech/CA9C74CAD02440A69FDC7189D7E1B6C2/7C24719EAB584A7D8751EB68A37B3DE9/TIConnectCE-6.0.1.344.msi'

Start-ChocolateyProcessAsAdmin "certutil -addstore 'TrustedPublisher' '$toolsDir\texas.cer'"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url

  softwareName  = 'ti-connect-ce*'

  checksum      = '72D19FAE9B0273E3AE25BC6E898CE422FBB4DEE65D44F2785A2FFB4F30074F28'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
