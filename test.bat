::������
set blocks=3000
::������%
set redundancy=3
::�ָ��ļ�����
set recovery_files=4

set previous_path=E:\galgame

set file_name=name

par2j64 c /fo /sn%blocks% /rr%redundancy% /rf%recovery_files% /ri %previous_path%\tmp\file_name *

pause