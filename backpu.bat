@echo off

::�����б������⣬ʹ��GBK����
chcp 936 

::ѹ�����ļ���·������Ҫ��˫���ţ����һ���ַ���Ҫб�ܡ�·�����������ַ������޷�ʶ��
@REM set folder_path=
set /p folder_path="�����ļ���·��(��Ҫ��˫���ţ����һ���ַ���Ҫб��): "
echo folder_path:          %folder_path%
::ѹ���ɵ��ļ���
@REM set file=
for /f %%i in ('python random_string.py') do set "file=%%i"
echo file name:            %file%
::ѹ������
@REM set password=
for /f %%i in ('python random_string.py') do set "password=%%i"
echo password(remember):   %password%
::�־��С
set size=1g
::��һ���ļ���·��
for %%I in ("%folder_path%") do set "previous_path=%%~dpI"
echo parent folder:        %previous_path%


::-mhe�����ļ���
::-v�־��С
7z a %previous_path%\%file%\%file%.7z "%folder_path%" -p%password% -mhe -v%size%


::������
set blocks=3000
::�����%������ȸ���ʵ����ֱ�Ӷ��ر���
set redundancy=3
::�ָ��ļ�����
set recovery_files=4
::*�Ƕ������ļ����д���
par2j64 c /sn%blocks% /rr%redundancy% /rf%recovery_files% %previous_path%\%file%\%file% *

echo 
echo remember password,remember password,remember password!��ס���룡  %password%
pause
echo remember password,remember password,remember password!��ס���룡  %password%
pause
echo remember password,remember password,remember password!��ס���룡  %password%
pause