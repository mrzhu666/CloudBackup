import os
import string
import random


class backup():
    folder_path = ""
    file = ""
    password = ""
    size = "3.9g"
    x = "9"

    def __init__(self):
        self.file = self.generateRandomString()
        self.password = self.generateRandomString()

    def backupCompress(self, path: str):
        command = " ".join(["7z a ", path + ".7z", path, "-p" + self.password, "-mhe", "-v" + self.size])
        os.system(command)

    def createRecovery(self, path: str):
        pass

    @staticmethod
    def generateRandomString(length: int = 30) -> str:
        characters = string.ascii_lowercase + string.digits + string.ascii_uppercase
        return ''.join(random.choice(characters) for _ in range(length))
