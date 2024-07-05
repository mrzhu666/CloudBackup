import os
import string
import random
import time


class WindowBackup:
    execute_7z = "7z"  # 7z执行文件路径
    size = "3.9g"  # 分卷大小
    folder_path = ""  # 文件夹路径
    folder_name = ""  # 文件夹名
    output_path = ""  # 输出文件路径
    password = ""  # 密码

    def backupCompress(self, folder_path: str, output_path: str = "", random_file_name: bool = False,
                       password_flag: bool = False, segment_flag: bool = False):
        """

        :param folder_path:
        :param output_path:
        :param random_file_name: 是否启用随机文件名
        :param password_flag: 是否启用随机密码
        :param segment_flag: 是否分卷
        """
        self.folder_path = folder_path
        self.folder_name = folder_path.split("\\")[-1]
        self.output_path = output_path
        command = [self.execute_7z, "a"]
        if len(self.output_path) == 0:
            # 如果为空，则输出放到要压缩的文件夹的上级
            self.output_path = "\\".join(folder_path.split("\\")[:-1])
        # 当前时间
        now = time.strftime("%Y-%m-%d-%H_%M_%S", time.localtime(time.time()))
        self.output_path = self.output_path + "\\" + self.folder_name + "_" + now + ".7z"
        print("output_path: " + self.output_path)
        command.append("\"" + self.output_path + "\"")
        command.append("\"" + self.folder_path + "\"")
        if password_flag:
            self.password = self.generateRandomString()
            command.append("-p" + self.password)
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
