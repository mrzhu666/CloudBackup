import os

import yaml

import platform

from backup.LinuxBackup import LinuxBackup
from backup.WindowBackup import WindowBackup

if __name__ == '__main__':

    curPath = os.path.dirname(os.path.realpath(__file__))
    # 获取yaml文件路径
    yamlPath = os.path.join(curPath, "config.yml")
    f = open(yamlPath, 'r', encoding='utf-8')
    cfg = f.read()
    config = yaml.load(cfg, yaml.Loader)
    print(config)

    if platform.system().lower() == 'windows':
        print("windows")
        config = config["window"]
        for item in config.keys():
            bu = WindowBackup()
            bu.backupCompress(config[item]["folder_path"], config[item]["output_path"])
    elif platform.system().lower() == 'linux':
        print("linux")
        config = config["linux"]
        for item in config.keys():
            bu = LinuxBackup()
            bu.backupCompress(config[item]["folder_path"], config[item]["output_path"])