# Install chocolatey to begin
Write-Output "Installing chocolatey..."
Set-ExecutionPolicy AllSigned

# This code is from: https://chocolatey.org/install
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Need to refresh before running choco commands
refreshenv

# Install git first
Write-Output "Installing git and adding to path..."
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"

# Install my frequently used programs
# Remove geforce-experience if using Intel integrated graphics or AMD
Write-Output "Beginning installation of programs..."
$packages = 'ffmpeg', 'notepadplusplus', 'vim', 'qbittorrent', 'firefox', 'audacity',
'keepassxc', 'spotify', 'python', 'youtube-dl', 'sumatrapdf', 'libreoffice-still', 'everything',
'vscode', '7zip.install', 'putty.install', 'androidstudio', 'vcredist140', 'nodejs.install',
'virtualbox', 'geforce-experience', 'steam'

# Total up the programs to be installed
$numberOfProgs = 0
ForEach ($j in $packages) {
	$numberOfProgs++
}

# Install each program and output progress
$j = 0
ForEach ($i in $packages) {
	j++
	Write-Output "Installing package $j/$numberOfProgs"
    choco install $i -y
}