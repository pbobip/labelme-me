# labelme-me

基于上游 [`labelme`](https://github.com/wkentaro/labelme) `v5.11.4` 的完整源码 fork，面向 Windows 标注流程做了若干定制。

这个仓库适合两类使用方式：

1. 直接作为源码仓库使用、修改、继续维护
2. 下载发布包后，在 Windows 上按教程安装成你自己的定制版 `Labelme`

## 仓库定位

- 上游基线：`labelme v5.11.4`
- 当前形态：完整源码 fork，不是补丁仓库
- 许可证：`GPL-3.0-only`
- 适用平台：优先面向 Windows

## 当前定制功能

1. 选中 shape 后按 `C`，切换 `done` 状态。
2. 右侧对象列表显示状态文本，如 `[DONE]`。
3. `done=true` 的 shape 用绿色显示。
4. 工具栏增加 `Contrast 1/3` 按钮，可在 `1x` 和 `3x` 对比度之间快速切换。
5. 顶部工具栏隐藏“删除当前标注文件”按钮，降低误删风险。
6. `Ctrl + Click` 在边上添加控制点。
7. `X / Backspace` 删除当前选中的控制点。
8. `Alt + 左键拖框` 可跨多个 shape 框选控制点，随后按 `X / Backspace` 批量删除。
9. 默认提供对象级标记：`done / checked / uncertain`。

详细说明见：

- [功能说明](docs/CUSTOM_FEATURES.md)
- [Windows 安装教程](docs/WINDOWS_INSTALL.md)
- [首版发布说明](docs/RELEASE_NOTES_v5.11.4-custom.1.md)

## 仓库内新增的辅助文件

```text
config/
  .labelmerc.example
docs/
  CUSTOM_FEATURES.md
  WINDOWS_INSTALL.md
scripts/
  install_windows_custom.ps1
  build_release_zip.ps1
```

## 快速安装

### 方式 1：从源码安装

```powershell
git clone https://github.com/pbobip/labelme-me.git
cd labelme-me
powershell -ExecutionPolicy Bypass -File .\scripts\install_windows_custom.ps1
```

### 方式 2：从 Release zip 安装

1. 下载本仓库 Release 页面中的 zip 包
2. 解压
3. 在解压目录执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install_windows_custom.ps1
```

## 启动方式

如果按默认脚本安装，程序会装到仓库目录下的 `.venv` 中。

启动命令：

```powershell
.\.venv\Scripts\labelme.exe
```

## 推荐使用流程

1. 安装完成后先启动一次程序。
2. 检查 `C` 切换 `done` 是否生效。
3. 检查 `Contrast 1/3` 按钮是否显示。
4. 检查 `Ctrl + Click` 是否可以在边上加点。
5. 检查 `Alt + 左键拖框` 后，`X` 是否能批量删点。

## 发布 Release

仓库自带一个打包脚本：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\build_release_zip.ps1
```

执行后会在仓库外层生成一个 zip 包，适合直接上传到 GitHub Release。

## 与上游的关系

本仓库是对上游 `labelme v5.11.4` 的定制 fork。  
如果后续要同步上游更新，建议通过 `upstream` 远程逐步 cherry-pick 或 merge，不要直接覆盖本地定制。

## 致谢

- Upstream project: [wkentaro/labelme](https://github.com/wkentaro/labelme)
