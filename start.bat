@echo off
chcp 65001 >nul
echo ========================================
echo   考勤数据脱敏系统
echo ========================================
echo.
echo 请选择要启动的工具:
echo.
echo [1] 数据脱敏工具 (index.html)
echo [2] 转码解码映射表系统 (mapping.html)
echo [3] 查看使用文档 (README.md)
echo [4] 查看转码解码指南 (DECODE_GUIDE.md)
echo [5] 查看示例模板 (TEMPLATE.md)
echo [0] 退出
echo.
set /p choice=请输入选项 (0-5):

if "%choice%"=="1" (
    start "" "index.html"
    echo.
    echo 已启动数据脱敏工具...
    pause
    exit
)

if "%choice%"=="2" (
    start "" "mapping.html"
    echo.
    echo 已启动转码解码映射表系统...
    pause
    exit
)

if "%choice%"=="3" (
    start "" "README.md"
    echo.
    echo 已打开使用文档...
    pause
    exit
)

if "%choice%"=="4" (
    start "" "DECODE_GUIDE.md"
    echo.
    echo 已打开转码解码指南...
    pause
    exit
)

if "%choice%"=="5" (
    start "" "TEMPLATE.md"
    echo.
    echo 已打开示例模板...
    pause
    exit
)

if "%choice%"=="0" (
    echo.
    echo 再见!
    pause
    exit
)

echo.
echo 无效选项,请重新运行程序!
pause
