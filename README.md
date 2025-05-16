# 在 Windows 上、使用一个极小的 MSYS2 环境、搭建 PGMQ 安装器

[pgmq](https://github.com/pgmq/pgmq) 是 Postgres 上实现的轻量级消息队列。

官方安装器基于 Makefile，不过它可以轻松地使用 [MSYS2](https://www.msys2.org/) 运行，无需任何修改。

如果全量安装的 MSYS2 对你来说不是问题，那么本项目对你没有什么帮助。这里只是呈现一个极小的 MSYS2 环境，足以完成 PGMQ 的安装，且适合分发。

分三步完成：

1. 解压缩 [pgmq-1.5.1.zip](https://github.com/pgmq/pgmq/releases/tag/v1.5.1) 中的 `pgmq-1.5.1\pgmq-extension` 目录，保持命名 `pgmq-extension` 不变。
2. 请参考 [tree.txt](./tree.txt) 中的文件结构，将它们从全量安装的 MSYS2 复制到 `usr/bin` 中。
3. 运行 `powershell -NoExit -ExecutionPolicy ByPass -File .\build.ps1`。

# Build a PGMQ installer with minimal MSYS2 environment on Windows

[pgmq](https://github.com/pgmq/pgmq) is a lightweight message queue on Postgres.

The official installer is based on Makefile, and lucky, it's easy to use [MSYS2](https://www.msys2.org/) to run without modification.

If full installed MSYS2 is good for you, please just install it and there is nothing difficult. Here I'll show you a minimal MSYS2 environment which is good enough to install PGMQ and is better to distribute.

3 steps:

1. Unzip `pgmq-1.5.1\pgmq-extension` from [pgmq-1.5.1.zip](https://github.com/pgmq/pgmq/releases/tag/v1.5.1) to this folder.
2. Copy and paste files listed in [tree.txt](./tree.txt) from full installed MSYS2 to `usr/bin`.
3. Run `powershell -NoExit -ExecutionPolicy ByPass -File .\build.ps1`.
