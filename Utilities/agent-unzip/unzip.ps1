param (
    [string]$pathToZipFile,
    [string]$pathToZipFolder,
    [string]$overwrite
)

Write-Verbose 'Entering sample.ps1'
Write-Verbose "pathToZipFile = $pathToZipFile"
Write-Verbose "pathToZipFolder = $pathToZipFolder"
Write-Verbose "overwrite = $overwrite"

if($overwrite -eq "true"){
    $overwrite = $true
}else{
    $overwrite = $false
}

if ($overwrite -and (Test-Path $pathToZipFolder)){
    Write-Verbose "Removing the old files"
    Remove-Item $pathToZipFolder -Recurse
}

# Import the Task.Common dll that has all the cmdlets we need for Build
# import-module "Microsoft.TeamFoundation.DistributedTask.Task.Common"
Add-Type -A System.IO.Compression.FileSystem

[IO.Compression.ZipFile]::ExtractToDirectory($pathToZipFile, $pathToZipFolder)
