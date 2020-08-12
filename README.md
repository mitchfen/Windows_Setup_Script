# Mitch's Powershell Setup Script

Why do repetetive tasks when the computer can do them for you?

This simple Powershell script installs [chocolatey](https://chocolatey.org/) and uses choco commands to install my frequently used programs.  
It also grabs and runs four scripts from [Debloat-Windows-10](https://github.com/W4RH4WK/Debloat-Windows-10).  
  
This allows me to be up and running quickly on a fresh Windows install.  
Last tested on Windows 10 version 2004.

### Running the script

1) Download and unzip the repository.
2) Open Powershell as an administrator, navigate to the download location.
3) `PowerShell.exe -ExecutionPolicy UnRestricted -File .\setupWindows.ps1`
4) Close and reopen powershell (Must be a new window for git commands to work)
5) `PowerShell.exe -ExecutionPolicy UnRestricted -File .\debloat.ps1`

### TODO

* Find a way around the git issue so that the scripts can be combined
* Add code to remove all start menu pins