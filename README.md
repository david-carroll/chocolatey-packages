chocolatey-packages
===================

This repository contains Chocolatey Packages that are maintained by David Carroll.

**Notes for creating cropper.nupkg from cropper.nuspec**

1. From command prompt with elevated privileges, change to directory containing [packagename].nuspec file. 

2. Enter the following command line:

  <code>choco pack [packagename].nuspec</code>

3. Upload the generated [packagename].nupkg file to Chocolatey via website or the cpush command.

**References Regarding Chocolatey Packages**
 - https://github.com/chocolatey/chocolatey/wiki/CreatePackages
 - https://github.com/chocolatey/chocolatey/wiki/CommandsReference
 - https://github.com/chocolatey/chocolatey/wiki/CommandsPack
 - https://github.com/chocolatey/chocolatey/wiki/CommandsPush

**More About Chocolatey**
 - https://chocolatey.org
 - https://chocolatey.org/profiles/david.carroll
