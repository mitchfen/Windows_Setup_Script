# This script clones my configs and then places them in the proper directories.
# For some reason, after running the setup script, git is not immediatly recognized as a command, despite refreshenv
# So for now, the easiest way to achieve what I want, is to run setupWindows.ps1, followed by cloneConfigs.ps1 in a new Powershell window.

cd C:\Users\$env:UserName\Downloads

Write-Host "Cloning Debloat-Windows-10" -ForegroundColor Red
git clone https://github.com/W4RH4WK/Debloat-Windows-10.git

Write-Host "Running telemetry, privacy, app removal scripts" -ForegroundColor Red
cd .\Debloat-Windows-10\scripts
.\block-telemetry.ps1
.\fix-privacy-settings.ps1
.\remove-default-apps.ps1
.\remove-onedrive.ps1

Write-Host "Cleaning up" -ForegroundColor Red
cd C:\Users\$env:UserName\Downloads
Remove-Item -LiteralPath ".\Debloat-Windows-10" -Force -Recurse
