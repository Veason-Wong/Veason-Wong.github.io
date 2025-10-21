@echo off
echo ���ڹ��� VuePress ��Ŀ...
call pnpm run docs:build

if %ERRORLEVEL% NEQ 0 (
  echo ? ����ʧ�ܣ���ֹ�ű���
  pause
  exit /b %ERRORLEVEL%
)

echo ? ������ɣ��ύ�����͵� main ��֧...
git commit -m "blog update"
git push -f origin main

echo ? ������ɣ��л��� gh-pages ��֧����ȡ��̬ҳ��...
git switch gh-pages
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

