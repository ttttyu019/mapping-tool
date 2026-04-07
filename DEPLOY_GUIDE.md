# 🚀 一键部署指南

## 前置准备

### 1. 安装 Git
下载并安装：https://git-scm.com/download/win

安装时一路下一步即可，使用默认设置。

### 2. 创建 GitHub Token（首次需要）
1. 打开 https://github.com/settings/tokens/new
2. Note 填写 `mapping-tool`
3. Expiration 选择 `No expiration`（或选择一个较长的时间）
4. 勾选 `repo` 权限
5. 点击 `Generate token`
6. **立即复制保存这个 token**（页面刷新后就看不到了！）

## 使用方法

### 首次部署

1. **编辑 `deploy.bat`**
   - 用记事本打开 `deploy.bat`
   - 找到这行：`set GITHUB_USER=你的GitHub用户名`
   - 改成你的 GitHub 用户名，比如：`set GITHUB_USER=zhangsan`
   - 保存文件

2. **双击运行 `deploy.bat`**

3. **如果弹出登录窗口**
   - 用户名：你的 GitHub 用户名
   - 密码：填你的 **Token**（不是 GitHub 密码！）

4. **开启 GitHub Pages**
   - 打开 https://github.com/你的用户名/mapping-tool/settings/pages
   - Source 选择 `Deploy from a branch`
   - Branch 选择 `main`，文件夹选 `/ (root)`
   - 点击 Save
   - 等待 1-2 分钟

5. **访问你的网页**
   ```
   https://你的用户名.github.io/mapping-tool/mapping.html
   ```

### 日常更新

以后每次更新代码后，只需要：

1. 双击 `deploy.bat`
2. 等待几秒钟
3. 刷新网页即可看到更新

## 常见问题

### Q: 推送失败怎么办？
A: 检查以下几点：
- GitHub 用户名是否正确
- Token 是否有效（可能过期了）
- 网络是否正常

### Q: 网页显示 404？
A: 
- 检查 GitHub Pages 是否已开启
- 等待 1-2 分钟让 GitHub 处理
- 确认访问地址正确

### Q: 如何更新 Token？
A: 重新生成一个新 Token，下次推送时在登录窗口输入新 Token 即可。
