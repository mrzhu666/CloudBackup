# 云备份脚本

分享模板：

文件名，压缩密码

用[7-Zip](https://sparanoid.com/lab/7z/)解压缩，par是冗余文件，用于压缩文件7z损坏时修复，使用[MultiPar: Parchive tool (github.com)](https://github.com/Yutaka-Sawada/MultiPar)软件进行修复。



7z加密压缩文件夹

multipar添加恢复记录

准备工作：

- 安装python
- 安装7z和multipar。且将7z和multipar文件夹路径添加到环境变量中，可以使用命令行进行操作。

随机文件名+随机密码

每次备份需要设置：

- 文件夹路径

批处理文件不能用utf-8编码，中文乱码。可以用gbk

7z命令行参数在程序文件夹里有

