@echo off
setlocal EnableDelayedExpansion

@REM cd /D "%~dp0"

call :FindBinDir
if NOT DEFINED bindir (
  echo msys-2.0.dll not found in any predefined paths. Exiting. 1>&2
  exit /b 1
)

echo "rootdir=%rootdir%"

set LC_ALL=en_US.UTF-8

if NOT DEFINED MSYS (
  set MSYS=winsymlinks:nativestrict
)
if NOT DEFINED MSYSTEM (
  set MSYSTEM=MSYS
)

@REM 注意，只有 .sh 需要用 bash 解析执行；经 bash 运行 exe 会先检查它是否有 +x 权限，没有则报错 cannot execute binary file
"%bindir%bash" -l %*
exit /b %ERRORLEVEL%

:FindBinDir
set "rootdir="
set "bindir="
@REM %CD% : 当前目录
@REM %~dp0 : 脚本所在目录
for %%p in (
  "%CD%"
  "%~dp0"
  "%MSYS2_HOME%"
  "C:\msys64"
  "C:\app\msys64"
  "C:\opt\msys64"
  "C:\opt\scoop\apps\msys2\current"
  "C:\Program Files\msys64"
  "C:\Program Files (x86)\msys64"
) do (
  if EXIST "%%~p\usr\bin\msys-2.0.dll" (
    set "rootdir=%%~p"
    set "bindir=%%~p\usr\bin\"
    exit /b 0
  )
)
exit /b 1
