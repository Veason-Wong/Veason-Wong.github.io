@echo off
echo 拉取静态页面..
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

echo ?? 更新完成？
pause

