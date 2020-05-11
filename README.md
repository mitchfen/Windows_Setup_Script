# Mitch's Powershell Setup Script

Why do repetetive tasks when the computer can do them for you?

This simple Powershell script installs [chocolatey](https://chocolatey.org/) and uses choco commands to install my frequently used programs.  
It also clones my configuration files and runs three scripts from [Debloat-Windows-10](https://github.com/W4RH4WK/Debloat-Windows-10).  
  
This allows me to be up and running quickly on a fresh Windows install.  
Last tested on Windows 10 version 1909.

### Running the script

1) Download and unzip the repository.
2) Open Powershell as an administrator, navigate to the download location.
3) Run the command `Set-ExecutionPolicy RemoteSigned` to enable execution of the script.
4) Run `.\setup_windows.ps1`
5) When the setup script finishes, open a new Powershell window (Must be a new window for git commands to work)
6) Run `Set-ExecutionPolicy RemoteSigned`
7) Navigate to the directory where the scripts are saved, and run `.\clone_configs_and_debloat.ps1.ps1`
8) Finally, run `Set-ExecutionPolicy RemoteSigned`. Done!

### TODO

* Streamline the Set-ExecutionPolicy commands that the user must input manually - sign the scripts
* Find a way around the git issue so that the scripts can be combined
* Add code to remove all start menu pins