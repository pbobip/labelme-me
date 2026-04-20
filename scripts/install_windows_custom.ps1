param(
    [string]$PythonExe = "python",
    [string]$VenvDir = ".venv"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$venvPath = if ([System.IO.Path]::IsPathRooted($VenvDir)) { $VenvDir } else { Join-Path $repoRoot $VenvDir }

if (-not (Test-Path $venvPath)) {
    & $PythonExe -m venv $venvPath
    if ($LASTEXITCODE -ne 0) {
        throw "创建虚拟环境失败：$venvPath"
    }
}

$venvPython = Join-Path $venvPath "Scripts\\python.exe"
if (-not (Test-Path $venvPython)) {
    throw "未找到虚拟环境 Python：$venvPython"
}

& $venvPython -m pip install --upgrade pip
if ($LASTEXITCODE -ne 0) {
    throw "升级 pip 失败。"
}

& $venvPython -m pip install $repoRoot
if ($LASTEXITCODE -ne 0) {
    throw "安装当前仓库失败。"
}

$userConfig = Join-Path $env:USERPROFILE ".labelmerc"
$configSource = Join-Path $repoRoot "config\\.labelmerc.example"

if (Test-Path $userConfig) {
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $backup = "$userConfig.$timestamp.bak"
    Copy-Item $userConfig $backup -Force
    Write-Host "已备份旧配置：$backup"
}

Copy-Item $configSource $userConfig -Force
Write-Host "已写入配置：$userConfig"
Write-Host ""
Write-Host "安装完成。"
Write-Host "启动命令：$venvPath\\Scripts\\labelme.exe"
