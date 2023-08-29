code --list-extensions | ForEach-Object { "code --install-extension $_ --force" } | Set-Content -Path install-extensions.ps1
