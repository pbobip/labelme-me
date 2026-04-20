# 功能说明

## 基线版本

- 上游：`labelme v5.11.4`
- 当前仓库：`labelme-me`

## 功能 1：`C` 切换 `done`

- 主界面选中一个或多个 shape
- 按 `C`
- `done` 状态在 `true / false` 间切换

配套效果：

- 右侧对象列表文本显示 `[DONE]`
- `done=true` 的 shape 显示为绿色

## 功能 2：`Contrast 1/3`

工具栏新增一个 `Contrast 1/3` 按钮：

- 当前对比度偏低时，点一下切到 `3x`
- 当前对比度较高时，点一下切回 `1x`

作用：

- 不需要每次打开亮度/对比度弹窗
- 适合在看边界时快速切换观察状态

## 功能 3：隐藏顶部“删除当前标注文件”按钮

修改内容：

- 顶部工具栏去掉“删除当前标注文件”按钮

保留内容：

- 菜单中的删除文件入口
- 原快捷键

目的：

- 减少误触删除 JSON 的概率

## 功能 4：`Ctrl + Click` 在边上添加控制点

原始交互较不顺手，因此改为：

- `Ctrl + Click`：在边上添加控制点

## 功能 5：删除控制点

- `X`
- `Backspace`

两者都可以删除当前选中的控制点。

## 功能 6：`Alt + 左键拖框` 框选控制点

这个功能支持：

- 不需要先选中 shape
- 可以直接 `Alt + 左键拖框`
- 可跨多个 shape 一次性框选控制点
- 之后按 `X / Backspace` 批量删除

安全保护：

- `polygon` 至少保留 `3` 个点
- `linestrip` 至少保留 `2` 个点
- 不会直接把 shape 删坏

## 功能 7：默认对象级标记

默认配置文件中提供：

- `done`
- `checked`
- `uncertain`

这些标记写入对象级 `flags`，不是整图级 `flags`。

## 当前主要修改文件

- [labelme/app.py](C:/Users/pyd111/Desktop/labelme-me/labelme/app.py)
- [labelme/widgets/canvas.py](C:/Users/pyd111/Desktop/labelme-me/labelme/widgets/canvas.py)
- [config/.labelmerc.example](C:/Users/pyd111/Desktop/labelme-me/config/.labelmerc.example)
