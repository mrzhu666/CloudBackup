from backup.LinuxBackup import LinuxBackup

from datetime import datetime

from backup.WindowBackup import WindowBackup

if __name__ == '__main__':
    # path = input()
    path = "C:\\Users\\mrzhu\\AppData\\Roaming\\Anki2"
    output_path = "D:\\OneDrive - mail2.gdut.edu.cn\备份\\anki"
    bu = WindowBackup()
    bu.backupCompress(path, output_path)
