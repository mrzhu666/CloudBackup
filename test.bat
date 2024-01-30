::块数量
set blocks=3000
::冗余率%
set redundancy=3
::恢复文件数量
set recovery_files=4

set previous_path=E:\galgame

set file_name=name

par2j64 c /fo /sn%blocks% /rr%redundancy% /rf%recovery_files% /ri %previous_path%\tmp\file_name *

pause