# Mitchell's Powershell setup script

Why do repetetive tasks when the computer can do them for you?

This simple Powershell script installs [chocolatey](https://chocolatey.org/) and uses choco commands to install my frequently used programs.

This allows me to be up and running quickly on a fresh Windows install.  
Last tested on Windows 10 version 1909.

### Running the script

1) Download and unzip the repository.
2) Open Powershell as an administrator, navigate to the download location.
3) Run the command `set-executionpolicy unrestricted` to enable execution of the script.
4) Run `.\setupWindows.ps1`
5) When the setup script finishes, open a new Powershell window (Must be a new window)
6) Navigate to the directory where the scripts are saved, and run `.\cloneConfigs.ps1`