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


::��ȡ��һ���ļ���·��
for %%I in ("%folder_path%") do set "previous_path=%%~dpI"
echo parent folder:        %previous_path%

::����ļ���·������
set /p output_path="�Զ�������ļ���(��Ҫ��˫���ţ����һ���ַ���Ҫб�ܣ�Ϊ��������Ϊ��һ���ļ���)��"
if "%output_path%"=="" (
    set output_path=%previous_path%
)


::�־���С
set size=3.9g
::ѹ���ȼ���9Ϊ���ѹ���ʣ�Ĭ��Ϊ5
set x=9
::-mhe�����ļ���
::-v�־���С
@REM 7z a %output_path%\%file%\%file%.7z "%folder_path%" -p%password% -mhe -v%size%
7z a %output_path%\%file%\%file%.7z "%folder_path%" -p%password% -mhe -mx9


::������
set blocks=3000
::�����%������ȸ���ʵ����ֱ�Ӷ��ر���
set redundancy=3
::�ָ��ļ�����
set recovery_files=1
::*�Ƕ������ļ����д���
par2j64 c /sn%blocks% /rr%redundancy% /rf%recovery_files% %output_path%\%file%\%file% *

echo 
echo remember password,remember password,remember password!��ס���룡  %password%
pause
echo remember password,remember password,remember password!��ס���룡  %password%
pause
echo remember password,remember password,remember password!��ס���룡  %password%
pause