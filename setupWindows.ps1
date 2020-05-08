# Remember to use command "set-executionpolicy unrestricted" before script execution 

# Create a powershell profile
New-Item -path $profile -type file -force

# Set execution policy back to AllSigned after script begins running
Set-ExecutionPolicy AllSigned

Write-Host "Installing chocolatey..." -ForegroundColor Red
# This code is from: https://chocolatey.org/install
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Need to refresh before running choco commands
RefreshEnv.cmd

# Install git
Write-Host "Installing git and adding to path..." -ForegroundColor Red
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"

# Install my frequently used programs
# Remove geforce-experience if using Intel integrated graphics or AMD
Write-Host "Beginning installation of programs..." -ForegroundColor Red
$packages = 'python', 'golang', 'rust', 'sqlite', 'php', 'nodejs.install', 'ffmpeg', 'notepadplusplus', 'vim', 'qbittorrent', 'firefox', 'audacity',
'keepassxc', 'spotify',  'youtube-dl', 'sumatrapdf', 'everything',
'vscode', '7zip.install', 'putty.install', 'androidstudio', 'vcredist140', 'virtualbox', 'steam'

# Total up the programs to be installed
$numberOfProgs = 0
ForEach ($j in $packages) {
    $numberOfProgs++
}

# Install each program and output progress
$j = 0
ForEach ($i in $packages) {
    $j++
    Write-Host "Installing package $j/$numberOfProgs" -ForegroundColor Red
    choco install $i -y
}

# Overwrite Powershell profile
Copy-Item .\Microsoft.PowerShell_profile.ps1 C:\Users\$env:UserName\Documents\WindowsPowershell
RefreshEnv.cmd

# Grab my vimrc file and place it
cd C:\Users\$env:UserName\Downloads
git clone https://github.com/mitchfen/dotfiles.git
cd dotfiles
Copy-Item _vimrc C:\Users\$env:UserName\
cd ..
Remove-Item -LiteralPath ".\dotfiles" -Force -Recurse

# Disable hibernation - hiberfil.sys wastes so much space
powercfg -h off
