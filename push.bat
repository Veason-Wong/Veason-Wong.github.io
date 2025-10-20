@echo off
echo 正在构建 VuePress 项目...
call pnpm run docs:build

if %ERRORLEVEL% NEQ 0 (
  echo ? 构建失败，终止脚本！
  pause
  exit /b %ERRORLEVEL%
)

echo ? 构建完成，进入构建输出目录...
cd .vuepress/dist

echo 初始化 Git 仓库...
git init
git add .
git commit -m "deploy"

echo 推送到 GitHub gh-pages 分支...
git branch -M gh-pages
git remote remove origin
git remote add origin https://github.com/Veason-Wong/Veason-Wong.git
git push -f origin gh-pages

echo ?? 更新完成！
pause

