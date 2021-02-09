[![Powershell](https://img.shields.io/badge/PowerShell-5391FE?style=flat-square&logo=PowerShell&logoColor=white)]()
[![Chocolatey](https://img.shields.io/badge/Chocolatey-80B5E3?style=flat-square&logo=Chocolatey&logoColor=white)]()

Why do repetetive tasks when the computer can do them for you?

This simple Powershell script installs [chocolatey](https://chocolatey.org/) and then uses choco commands to install my frequently used programs.  
  
This allows me to be up and running quickly on a fresh Windows install.  

### Running the script

1) Download and unzip the repository.
2) Open Powershell as an administrator in the download location.
3) `PowerShell.exe -ExecutionPolicy UnRestricted -File .\setup.ps1`

### Dependencies

The script downloads and uses [chocolatey](https://chocolatey.org/) which is distributed under the Apache License 2.0.  
