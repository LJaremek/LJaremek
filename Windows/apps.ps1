$urls = @(
    "https://go.microsoft.com/fwlink/?LinkID=534107",
    "https://7-zip.org/a/7z2301-x64.exe",
    "https://www.libreoffice.org/donate/dl/win-x86_64/24.2.2/pl/LibreOffice_24.2.2_Win_x86-64.msi"
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
