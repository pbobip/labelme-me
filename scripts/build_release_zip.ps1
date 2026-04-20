param(
    [string]$OutputDir = ""
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$repoName = Split-Path $repoRoot -Leaf
$parentDir = Split-Path $repoRoot -Parent
$targetDir = if ([string]::IsNullOrWhiteSpace($OutputDir)) { $parentDir } else { $OutputDir }
$zipName = "$repoName-v5.11.4.post1-win-source.zip"
$zipPath = Join-Path $targetDir $zipName
$stageDir = Join-Path $env:TEMP "$repoName-release-stage"

if (Test-Path $stageDir) {
    Remove-Item -Recurse -Force $stageDir
}
New-Item -ItemType Directory -Path $stageDir | Out-Null

$exclude = @(".git", ".venv", "__pycache__", ".pytest_cache", "dist", "build")

Get-ChildItem $repoRoot -Force | ForEach-Object {
    if ($exclude -contains $_.Name) {
        return
    }
    Copy-Item $_.FullName $stageDir -Recurse -Force
}

if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

Compress-Archive -Path (Join-Path $stageDir '*') -DestinationPath $zipPath -Force
Remove-Item -Recurse -Force $stageDir

Write-Host "已生成发布包：$zipPath"
