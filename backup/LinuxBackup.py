import os
import string
import random
from datetime import datetime
import time

# ./7zzs a ~/self.7z ~/Self-Hosted -mhe -mx9
class LinuxBackup:
    execute_7z = "~/7z/7zzs"  # 7z执行文件路径
    size = "3.9g"  # 分卷大小

    def backupCompress(self, folder_path: str, output_file: str = "", random_file_name: bool = False,
                       password_flag: bool = False, segment_flag: bool = False):
        """

        :param folder_path:
        :param output_file:
        :param random_file_name: 是否启用随机文件名
        :param password_flag: 是否启用随机密码
        :param segment_flag: 是否分卷
        """
        folder_name = folder_path.split("/")[-1]
        command = [self.execute_7z, "a"]
        if len(output_file) == 0:
            # current = "_".join(str(datetime.now()).split())
            now = time.strftime("%Y-%m-%d-%H_%M_%S", time.localtime(time.time()))
            # 输出放到要压缩的文件夹的上级
            output_file = "/".join(folder_path.split("/")[:-1]) + "/" + folder_name + "_" + now + ".7z"
            print("output_file: " + output_file)
            command.append(output_file)
        else:
            command.append(output_file)
        command.append(folder_path)
        if password_flag:
            password = self.generateRandomString()
            command.append("-p" + password)
        command.append("-mhe")
        command.append("-mx9")
        if segment_flag:
            command.append("-v" + self.size)
        os.system(" ".join(command))

    def createRecovery(self, path: str):
        pass

    @staticmethod
    def generateRandomString(length: int = 30) -> str:
        characters = string.ascii_lowercase + string.digits + string.ascii_uppercase
        return ''.join(random.choice(characters) for _ in range(length))
