@echo off
echo 正在构建 VuePress 项目...
call pnpm run docs:build

if %ERRORLEVEL% NEQ 0 (
  echo ? 构建失败，终止脚本！
  pause
  exit /b %ERRORLEVEL%
)

echo ? 构建完成，提交并推送到 main 分支...
git commit -m "blog update"
git push -f origin main

echo ? 推送完成，切换到 gh-pages 分支并拉取静态页面...
git switch gh-pages
git checkout main -- docs/.vitepress/dist/*
rmdir /s /q assets
move /Y docs\.vitepress\dist\* .
move /Y docs\.vitepress\dist\assets
rmdir /s /q docs

echo Git 提交...
git add .
git commit -m "blog update"

echo 推送到 GitHub gh-pages 分支...
git push -f origin gh-pages

echo ?? 更新完成！
pause

