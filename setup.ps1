# Simple check to determine if current user is administrator
$isAdmin = (new-object System.Security.Principal.WindowsPrincipal([System.Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole("Administrators")
if ($isAdmin) {
    # Create a powershell profile
    New-Item -path $profile -type file -force

    Write-Host "Installing chocolatey" -ForegroundColor Magenta
    # This line is from: https://chocolatey.org/install
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    # Need to refresh before running choco commands
    RefreshEnv.cmd

    # Install git
    Write-Host "Installing git and adding to path" -ForegroundColor Magenta
    choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"

    # Install my frequently used programs
    Write-Host "Beginning installation of programs..." -ForegroundColor Magenta
    $packages = @('python', 'sqlite', 'youtube-dl', 'ffmpeg', 'keepassxc', 'vscode', 'devcon.portable', 
    '7zip.install', 'vcredist140', 'docker-desktop', 'authy-desktop', 'github-desktop', 'powershell-core', 
    'brave', 'hwinfo', 'golang', 'nodejs', 'microsoft-teams')

    # Install each program and output progress
    $count = 0
    For ($i = 0 ; $i -lt $packages.count ; $i++) {
        Write-Host "Installing package ($j/$packages.count)" -ForegroundColor Magenta
        choco install $i -y
    }

    Write-Host "Finishing up..." -ForegroundColor Magenta

    # Disable hibernation
    powercfg -h off

    #Disable Bing search
    New-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -PropertyType DWORD -Value 0
    Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" "CortanaConsent" 0

    # Enabling Verbose mode in Windows 10
    New-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name VerboseStatus -PropertyType DWORD -Value 1

    # Stop Apps from opening at startup
    Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "KeePassXC"
    Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "OneDrive"
    Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "com.squirrel.Teams.Teams"

    # Remove 3D objects folder, show file extensions
    Remove-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
    Remove-Item "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0

    # Install Powershell Modules
    Install-Module posh-git
    Install-Module oh-my-posh

    # Enable Windows Subsytem for Linux
    Write-Host "Enabling Windows Subsytem for Linux" -ForegroundColor Magenta
    Enable-WindowsOptionalFeature -Online -FeatureName $("VirtualMachinePlatform", "Microsoft-Windows-Subsystem-Linux")
    
} else {    
    Write-Host "Please run this script as an administrator" -ForegroundColor Red
}
