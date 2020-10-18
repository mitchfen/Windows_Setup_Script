# See the readme before executing.

# Create a powershell profile
New-Item -path $profile -type file -force

Write-Host "Installing chocolatey" -ForegroundColor Red
# This code is from: https://chocolatey.org/install
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Need to refresh before running choco commands
RefreshEnv.cmd

# Install git
Write-Host "Installing git and adding to path" -ForegroundColor Red
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"

# Install my frequently used programs
Write-Host "Beginning installation of programs..." -ForegroundColor Red
$packages = 
    'python --version=3.8.0', 'sqlite', 'ffmpeg', 'notepadplusplus', 'vim', 'firefox', 'keepassxc', 
    'spotify',  'youtube-dl', 'sumatrapdf', 'everything', 'vscode', '7zip.install', 
    'putty.install', 'vcredist140', 'virtualbox', 'steam', 'github-desktop', 
    'brave', 'hwinfo.portable', 'golang'

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

# Disable hibernation - hiberfil.sys wastes so much space
powercfg -h off

#Disable Bing search
Write-Host "Disabling Bing search because it's horrible" -ForegroundColor Red
New-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -PropertyType DWORD -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" "CortanaConsent" 0

# Enabling Verbose mode in Windows 10
Write-Host "Enabling verbose mode so you can see what happens during the boot process" -ForegroundColor Red
New-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name VerboseStatus -PropertyType DWORD -Value 1

# Stop Apps from opening at startup
Write-Host "Stop Spotify, Steam, KeepassXC, OneDrive opening at startup" -ForegroundColor Red
Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "Spotify"
Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "KeePassXC"
Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "Steam"
Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "OneDrive"

# Remove 3D objects folder, show file extensions
Write-Host "Removing silly 3D object folder, enabling file extensions in file explorer" -ForegroundColor Red
Remove-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
Remove-Item "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0


Write-Host "DONE! :D" -ForegroundColor Red