@echo off

::中文有编码问题，使用GBK编码
chcp 936 

::压缩的文件夹路径。不要用双引号，最后一个字符不要斜杠。路径上有特殊字符可能无法识别
@REM set folder_path=
set /p folder_path="输入文件夹路径(不要用双引号，最后一个字符不要斜杠): "
echo folder_path:          %folder_path%

::压缩成的文件名
@REM set file=
for /f %%i in ('python random_string.py') do set "file=%%i"
echo file name:            %file%

::压缩密码
@REM set password=
for /f %%i in ('python random_string.py') do set "password=%%i"
echo password(remember):   %password%


::获取上一级文件夹路径
for %%I in ("%folder_path%") do set "previous_path=%%~dpI"
echo parent folder:        %previous_path%

::输出文件夹路径设置
set /p output_path="自定义输出文件夹(不要用双引号，最后一个字符不要斜杠，为空则设置为上一级文件夹)："
if "%output_path%"=="" (
    set output_path=%previous_path%
)


::分卷大小
set size=3.9g
::压缩等级，9为最高压缩率，默认为5
set x=9
::-mhe加密文件名
::-v分卷大小
@REM 7z a %output_path%\%file%\%file%.7z "%folder_path%" -p%password% -mhe -v%size%
7z a %output_path%\%file%\%file%.7z "%folder_path%" -p%password% -mhe -mx9


::块数量
set blocks=3000
::冗余度%。冗余度高其实不如直接多重备份
set redundancy=3
::恢复文件数量
set recovery_files=1
::*是对所有文件进行处理
par2j64 c /sn%blocks% /rr%redundancy% /rf%recovery_files% %output_path%\%file%\%file% *

echo 
echo remember password,remember password,remember password!记住密码！  %password%
pause
echo remember password,remember password,remember password!记住密码！  %password%
pause
echo remember password,remember password,remember password!记住密码！  %password%
pause