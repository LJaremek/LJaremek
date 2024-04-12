$urls = @(
    "https://vscode.download.prss.microsoft.com/dbazure/download/stable/e170252f762678dec6ca2cc69aba1570769a5d39/VSCodeUserSetup-x64-1.88.1.exe",  # VSCode
    "https://7-zip.org/a/7z2301-x64.exe",  # 7zip
    "https://www.libreoffice.org/donate/dl/win-x86_64/24.2.2/pl/LibreOffice_24.2.2_Win_x86-64.msi",  # LibreOffice
    "https://desktop.githubusercontent.com/github-desktop/releases/3.3.13-1b0804db/GitHubDesktopSetup-x64.exe",  # GitHub
    "https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9041/DiscordSetup.exe",  # Discord
    "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B3BC622C9-A80C-D08C-D17C-2B0C5593FD1E%7D%26lang%3Dpl%26browser%3D4%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26brand%3DCHBD%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe"  # Google Chrome
)

$downloadPath = "$env:USERPROFILE\Downloads"

foreach ($url in $urls) {
    $fileName = [System.IO.Path]::GetFileName($url)

    $fileFullPath = Join-Path -Path $downloadPath -ChildPath $fileName

    Invoke-WebRequest -Uri $url -OutFile $fileFullPath

    if ($fileName -like "*.msi") {
        Start-Process "msiexec.exe" -ArgumentList "/i `"$fileFullPath`" /qn" -Wait
    }
    elseif ($fileName -like "*.exe") {
        Start-Process $fileFullPath -ArgumentList "/S" -Wait
    }
}

Write-Host "Wszystkie aplikacje zostały zainstalowane."
