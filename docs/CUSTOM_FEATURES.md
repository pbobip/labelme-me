# 功能说明

## 版本信息

- 上游基线：`labelme v5.11.4`
- 当前仓库：`labelme-me`
- 当前发布版本：`v5.11.4.post1`

## 设计目标

这套定制不是为了把 `labelme` 变成另一套软件，而是为了优化高频标注动作：

- 状态切换更快
- 图像观察更快
- 控制点编辑更快
- 误删除风险更低

## 功能总览

| 功能 | 说明 |
| --- | --- |
| `C` 切换 `done` | 选中 shape 后快速切换完成状态 |
| `[DONE]` 文本提示 | 右侧列表直接显示状态 |
| 绿色高亮 | `done=true` 的 shape 用绿色显示 |
| `Contrast 1/3` | 工具栏一键切换对比度 |
| `Ctrl + Click` 加点 | 在边上更顺手地添加控制点 |
| `X / Backspace` 删点 | 删除当前选中的控制点 |
| `Alt + 左键拖框` | 跨多个 shape 框选控制点 |
| 批量删点 | 框选后按 `X / Backspace` 删除 |
| 隐藏顶部删文件按钮 | 降低误删当前标注文件的概率 |
| 默认对象级 flags | `done / checked / uncertain` |

## 详细说明

### 1. `C` 切换 `done`

使用方式：

1. 在主界面选中一个或多个 shape
2. 按 `C`
3. `done` 状态在 `true / false` 间切换

配套效果：

- 右侧对象列表会显示 `[DONE]`
- 对应 shape 会变绿色

### 2. `Contrast 1/3`

工具栏新增 `Contrast 1/3` 按钮。

行为：

- 当前对比度低时，点一下切到 `3x`
- 当前对比度高时，点一下切回 `1x`

作用：

- 不需要先打开亮度/对比度弹窗
- 适合在边界观察时快速切换

### 3. 隐藏顶部“删除当前标注文件”按钮

修改内容：

- 仅隐藏顶部工具栏里的删除文件按钮

仍然保留：

- 菜单中的删除文件入口
- 原快捷键

目的：

- 避免高频点击工具栏时误删当前 `JSON`

### 4. `Ctrl + Click` 在边上添加控制点

原始交互不够顺手，因此改成：

- `Ctrl + Click`：在边上添加控制点

### 5. 删除控制点

支持：

- `X`
- `Backspace`

两者都可以删除当前选中的控制点。

### 6. `Alt + 左键拖框` 框选控制点

交互：

- 不需要先选中 shape
- 直接 `Alt + 左键拖框`
- 框内控制点会进入选中状态
- 之后按 `X / Backspace` 批量删除

特点：

- 支持跨多个 shape 一次性框选
- 删除前会按 shape 分组处理

安全保护：

- `polygon` 至少保留 `3` 个点
- `linestrip` 至少保留 `2` 个点
- 不会直接把 shape 删坏

### 7. 默认对象级标记

默认配置中提供：

- `done`
- `checked`
- `uncertain`

这些状态写入对象级 `flags`，不是整图级 `flags`。

## 当前主要修改文件

- [labelme/app.py](../labelme/app.py)
- [labelme/widgets/canvas.py](../labelme/widgets/canvas.py)
- [config/.labelmerc.example](../config/.labelmerc.example)

## 不包含的范围

当前版本没有做这些事：

- 没有重写上游整体架构
- 没有新增自动贴边或智能吸附算法
- 没有改变 `labelme` 的 JSON 基本格式
- 没有变成新的独立标注协议
