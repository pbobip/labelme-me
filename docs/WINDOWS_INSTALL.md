# Windows 安装教程

## 方案 A：直接用仓库脚本安装

### 1. 准备 Python

建议使用 Python 3.10 到 3.13。

确认命令可用：

```powershell
python --version
```

### 2. 克隆仓库

```powershell
git clone https://github.com/pbobip/labelme-me.git
cd labelme-me
```

### 3. 运行安装脚本

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install_windows_custom.ps1
```

默认行为：

- 在仓库目录下创建 `.venv`
- 用该虚拟环境安装当前仓库
- 备份现有 `C:\Users\<用户名>\.labelmerc`
- 覆盖为仓库内的示例配置

### 4. 启动程序

```powershell
.\.venv\Scripts\labelme.exe
```

## 方案 B：先手工创建虚拟环境，再调用脚本

```powershell
python -m venv .venv
.\.venv\Scripts\activate
powershell -ExecutionPolicy Bypass -File .\scripts\install_windows_custom.ps1 -PythonExe .\.venv\Scripts\python.exe -VenvDir .\.venv
```

## 安装后检查项

启动后建议确认：

1. 工具栏出现 `Contrast 1/3`
2. 顶部工具栏不再显示“删除当前标注文件”按钮
3. 选中 shape 后按 `C` 可切换 `done`
4. `Ctrl + Click` 可加点
5. `Alt + 左键拖框` 后按 `X` 可批量删点

## 如果你要恢复默认配置

安装脚本会先备份旧配置。  
你可以把备份过的 `.labelmerc.*.bak` 手动恢复回 `C:\Users\<用户名>\.labelmerc`。

## 如果你要打 Release 包

在仓库根目录执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\build_release_zip.ps1
```
