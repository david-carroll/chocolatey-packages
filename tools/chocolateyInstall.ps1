$packageName = 'cropper'
$installerType = 'msi'
$url = 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=cropper&DownloadId=173114&FileTime=129353966936070000&Build=20941'
$silentArgs = '/quiet'
$validExitCodes = @(0)

try {
    $chocTempDir = Join-Path $env:TEMP "chocolatey"
    $tempDir = Join-Path $chocTempDir "$packageName"
    if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir) | Out-Null}
    $file = Join-Path $tempDir "Cropper 1.9.4.zip"

    Write-Debug "Downloading 'Get-ChocolateyWebFile' for $packageName with url:`'$url`' ";      
    Get-ChocolateyWebFile $packageName $file $url 
    Write-Debug "Extracting 'Get-ChocolateyUnzip' for $packageName with path:`'$file`' ";     
    Get-ChocolateyUnzip $file $tempDir
    $installFile = gci $tempDir *.msi -name | select -First 1 # retrieve installer filename (MSI)
    $installSource = Join-Path $tempDir $installFile
  
    Write-Debug "Running 'Install-ChocolateyPackage' for $packageName with path:`'$installSource`' ";
    Install-ChocolateyInstallPackage $packageName $installerType $silentArgs $installSource -validExitCodes $validExitCodes    
    Write-ChocolateySuccess $packageName
    Remove-Item "$file" # cleanup ZIP
    #Remove-Item "$installSource" # cleanup MSI
  } catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw 
  }