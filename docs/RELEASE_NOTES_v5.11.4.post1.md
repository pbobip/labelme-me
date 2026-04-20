# Release Notes

## `v5.11.4.post1`

首个对外发布版本，基于上游 `labelme v5.11.4`。

### 新增

- `C` 切换 `done`
- 右侧列表显示 `[DONE]`
- `done` 绿色显示
- 工具栏 `Contrast 1/3` 快捷按钮
- `Ctrl + Click` 边上加点
- `Alt + 左键拖框` 框选控制点
- `X / Backspace` 删除单点或框选点
- 默认对象级标记 `done / checked / uncertain`

### 调整

- 顶部工具栏移除了“删除当前标注文件”按钮，避免误触

### 安装

推荐使用仓库内脚本：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install_windows_custom.ps1
```

### 发布包

打包命令：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\build_release_zip.ps1
```
