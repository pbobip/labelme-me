# Windows 安装教程

这份教程面向普通使用者，目标是让你在 Windows 下尽快把 `labelme-me` 跑起来。

## 安装前提

- Windows
- 已安装 Python 3.10 到 3.13
- 已安装 Git

先确认命令可用：

```powershell
python --version
git --version
```

## 推荐安装方式

### 方式 A：直接用仓库脚本安装

这是最推荐的方式。

#### 1. 克隆仓库

```powershell
git clone https://github.com/pbobip/labelme-me.git
cd labelme-me
```

#### 2. 运行安装脚本

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install_windows_custom.ps1
```

脚本默认会做这些事：

- 在仓库目录下创建 `.venv`
- 用该虚拟环境安装当前仓库
- 备份现有 `C:\Users\<用户名>\.labelmerc`
- 用仓库里的示例配置覆盖成新的 `.labelmerc`

#### 3. 启动程序

```powershell
.\.venv\Scripts\labelme.exe
```

## 备用安装方式

### 方式 B：先手工创建虚拟环境，再调用脚本

如果你想更明确地控制 Python 环境，可以这样做：

```powershell
python -m venv .venv
.\.venv\Scripts\activate
powershell -ExecutionPolicy Bypass -File .\scripts\install_windows_custom.ps1 -PythonExe .\.venv\Scripts\python.exe -VenvDir .\.venv
```

## 安装后检查

启动后建议先确认这些功能：

1. 工具栏出现 `Contrast 1/3`
2. 顶部工具栏不再显示“删除当前标注文件”按钮
3. 选中 shape 后按 `C` 可切换 `done`
4. `Ctrl + Click` 可在边上加点
5. `Alt + 左键拖框` 后按 `X` 可批量删点

## 常见问题

### 1. 安装脚本运行被拦截

可以这样执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install_windows_custom.ps1
```

### 2. 启动后没有看到定制功能

先确认：

- 你启动的是仓库里的 `.venv\Scripts\labelme.exe`
- 不是系统里其他环境下的 `labelme`

### 3. `.labelmerc` 被覆盖了

安装脚本会先备份旧配置。  
你可以把备份过的 `.labelmerc.*.bak` 手动恢复回 `C:\Users\<用户名>\.labelmerc`。

## Release 包

如果你是维护者，要自己生成发布包：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\build_release_zip.ps1
```

默认会在仓库外层生成 zip 文件。
