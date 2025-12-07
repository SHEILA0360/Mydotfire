
$dotfiles = "F:\Develop\Setting\dotfiles"
$nvimSrc = "$dotfiles\nvim"
$nvimDest = "$env:LOCALAPPDATA\nvim"

Write-Host "=== Neovim dotfiles linking script (Windows) ==="

# 既存 nvim のバックアップ
if (Test-Path $nvimDest) {
    Write-Host "Existing nvim found. Backing up → $nvimDest.backup"
    Move-Item -Path $nvimDest -Destination "$nvimDest.backup"
}

# シンボリックリンク作成
Write-Host "Linking $nvimSrc → $nvimDest"
New-Item -ItemType SymbolicLink -Path $nvimDest -Target $nvimSrc

Write-Host "Done!"
