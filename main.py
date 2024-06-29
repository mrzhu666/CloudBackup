from backup.LinuxBackup import LinuxBackup

from datetime import datetime

if __name__ == '__main__':
    path = input()
    bu = LinuxBackup()
    bu.backupCompress(path)
