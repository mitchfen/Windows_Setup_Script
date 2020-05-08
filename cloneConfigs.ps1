# This script clones my configs and then places them in the proper directories.
# For some reason, after running the setup script, git is not immediatly recognized as a command, despite refreshenv
# So for now, the easiest way to achieve what I want, is to run setupWindows.ps1, followed by cloneConfigs.ps1 in a new Powershell window.

cd C:\Users\$env:UserName\Downloads
git clone https://github.com/mitchfen/dotfiles.git

cd dotfiles
Copy-Item .\Microsoft.PowerShell_profile.ps1 C:\Users\$env:UserName\Documents\WindowsPowershell
Copy-Item _vimrc C:\Users\$env:UserName\
cd ..
Remove-Item -LiteralPath ".\dotfiles" -Force -Recurse
exit