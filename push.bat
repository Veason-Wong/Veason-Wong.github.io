@echo off
echo ��ȡ��̬ҳ��..
git checkout main -- docs/.vitepress/dist/*
rmdir /s /q assets
move /Y docs\.vitepress\dist\* .
move /Y docs\.vitepress\dist\assets
rmdir /s /q docs

echo Git �ύ...
git add .
git commit -m "blog update"

echo ���͵� GitHub gh-pages ��֧...
git push -f origin gh-pages

echo ?? ������ɣ�
pause

