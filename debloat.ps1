# This script just grabs the debloat scripts and runs them.
# For some reason, after running the setup script, git is not immediatly recognized as a command, despite refreshenv. Thats why you need to close and reopen Powershell.

cd C:\Users\$env:UserName\Downloads

Write-Host "Cloning Debloat-Windows-10" -ForegroundColor Red
git clone https://github.com/W4RH4WK/Debloat-Windows-10.git

Write-Host "Running telemetry, privacy, app removal scripts" -ForegroundColor Red
cd .\Debloat-Windows-10\scripts
.\block-telemetry.ps1
.\fix-privacy-settings.ps1
.\remove-default-apps.ps1
.\remove-onedrive.ps1

Write-Host "DONE! :D" -ForegroundColor Red