@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo   Mapping Tool 一键部署脚本
echo ========================================
echo.

:: 配置区域 - 请修改为你的信息
set GITHUB_USER=ttttyu019
set REPO_NAME=mapping-tool
set BRANCH=main

:: 检查是否已配置
if "%GITHUB_USER%"=="你的 GitHub 用户名" (
    echo ⚠️  请先编辑此脚本，将 GITHUB_USER 改为你的 GitHub 用户名
    echo.
    echo 例如: set GITHUB_USER=zhangsan
    echo.
    pause
    exit /b 1
)

:: 检查 Git 是否安装
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ 未检测到 Git，请先安装:
    echo    https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

:: 获取当前目录
set CURRENT_DIR=%~dp0
cd /d "%CURRENT_DIR%"

:: 检查是否已经是 Git 仓库
if not exist ".git" (
    echo 📦 首次部署，正在初始化仓库...
    echo.
    
    git init
    git remote add origin https://github.com/%GITHUB_USER%/%REPO_NAME%.git
    
    echo.
    echo ✅ Git 仓库初始化完成
) else (
    echo ✅ Git 仓库已存在
)

echo.
echo 📝 正在添加文件...
git add -A

echo.
echo 💾 正在提交更改...
set COMMIT_MSG=Update %date% %time:~0,8%
git commit -m "%COMMIT_MSG%" 2>nul
if %errorlevel% neq 0 (
    echo ℹ️  没有新的更改需要提交
)

echo.
echo 🚀 正在推送到 GitHub...
git branch -M %BRANCH%
git push -u origin %BRANCH%

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo ✅ 部署成功！
    echo ========================================
    echo.
    echo 🌐 你的网页地址:
    echo    https://%GITHUB_USER%.github.io/%REPO_NAME%/mapping.html
    echo.
    echo 📝 首次部署后，需要在 GitHub 开启 Pages:
    echo    1. 打开 https://github.com/%GITHUB_USER%/%REPO_NAME%/settings/pages
    echo    2. Source 选择 "Deploy from a branch"
    echo    3. Branch 选择 "main"，文件夹选 "/ (root)"
    echo    4. 点击 Save
    echo    5. 等待 1-2 分钟后访问上面的网址
    echo.
) else (
    echo.
    echo ❌ 推送失败！可能的原因:
    echo    1. GitHub 用户名配置错误
    echo    2. 仓库不存在或名称错误
    echo    3. 没有推送权限（需要登录）
    echo.
    echo 💡 如果弹出登录窗口，请输入:
    echo    - 用户名: 你的 GitHub 用户名
    echo    - 密码: 你的 Personal Access Token（不是密码！）
    echo.
    echo 获取 Token: https://github.com/settings/tokens/new
    echo 勾选 repo 权限即可
    echo.
)

pause
