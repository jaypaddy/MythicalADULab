#
# Import AduUpdate module
#
Import-Module .\AduUpdate.psm1

#
# Creating an example of import manifest for package update (libcurl4-doc without version number).
#
$compatInfo1 = New-AduUpdateCompatibility -DeviceManufacturer Contoso -DeviceModel Video

$importManifest = New-AduImportManifest -Provider 'Contoso' -Name 'SampleUpdate1' -Version '1.0.1' -UpdateType 'microsoft/apt:1' -InstalledCriteria 'Sample package update-1.0.1' -Compatibility $compatInfo1 -Files './sample-1.0.1-libcurl4-doc-apt-manifest.json'

$importManifestFile = '.\sample-package-update-1.0.1-importManifest.json'

$importManifest | Out-File $importManifestFile -Encoding UTF8


#
# Creating an example of import manifest for package update (remove libcur4-doc).
#
$compatInfo1 = New-AduUpdateCompatibility -DeviceManufacturer Contoso -DeviceModel Video

$importManifest = New-AduImportManifest -Provider 'Contoso' -Name 'SampleUpdate1' -Version '1.0.2' -UpdateType 'microsoft/apt:1' -InstalledCriteria 'Sample package update-1.0.2' -Compatibility $compatInfo1 -Files './sample-1.0.2-libcurl4-doc-remove-apt-manifest.json'

$importManifestFile = '.\sample-package-update-1.0.2-importManifest.json'

$importManifest | Out-File $importManifestFile -Encoding UTF8


#
# Creating an example of import manifest for package update (libcurl4-doc with a version number).
#
$compatInfo1 = New-AduUpdateCompatibility -DeviceManufacturer Contoso -DeviceModel Video

$importManifest = New-AduImportManifest -Provider 'Contoso' -Name 'SampleUpdate2' -Version '2.0.1' -UpdateType 'microsoft/apt:1' -InstalledCriteria 'Sample package update 2-2.0.1' -Compatibility $compatInfo1 -Files './sample-2.0.1-libcurl4-doc-7.58-apt-manifest.json'

$importManifestFile = '.\sample-package-update-2-2.0.1-importManifest.json'

$importManifest | Out-File $importManifestFile -Encoding UTF8






