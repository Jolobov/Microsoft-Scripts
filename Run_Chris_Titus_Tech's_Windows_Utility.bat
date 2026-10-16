@echo off
powershell.exe ^
	-NoLogo ^
	-NoProfile ^
	-ExecutionPolicy Bypass ^
	-Command "irm https://christitus.com/win | iex"
pause