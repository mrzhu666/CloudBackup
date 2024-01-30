import random
import string

# 生成随机字符串，大小写+数字

random.seed(None) # 当前系统时间为随机种子

def generate_random_string(length):
    characters = string.ascii_lowercase + string.digits + string.ascii_uppercase
    return ''.join(random.choice(characters) for _ in range(length))

if __name__ == "__main__":
    length = 30  # Adjust the length as needed
    random_string = generate_random_string(length)
    print(random_string)