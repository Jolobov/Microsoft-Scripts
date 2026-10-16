@echo off
powershell.exe ^
	-NoLogo ^
	-NoProfile ^
	-ExecutionPolicy Bypass ^
	-Command "irm https://get.activated.win | iex"
pause