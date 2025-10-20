@echo off
echo ���ڹ��� VuePress ��Ŀ...
call pnpm run docs:build

if %ERRORLEVEL% NEQ 0 (
  echo ? ����ʧ�ܣ���ֹ�ű���
  pause
  exit /b %ERRORLEVEL%
)

echo ? ������ɣ����빹�����Ŀ¼...
cd .vuepress/dist

echo ��ʼ�� Git �ֿ�...
git init
git add .
git commit -m "deploy"

echo ���͵� GitHub gh-pages ��֧...
git branch -M gh-pages
git remote remove origin
git remote add origin https://github.com/Veason-Wong/Veason-Wong.git
git push -f origin gh-pages

echo ?? ������ɣ�
pause

