@echo off

set CONAN_HOME=%~dp0.conan

echo -- installing conan and cmake
call python -m venv %~dp0.venv
call %~dp0.venv\Scripts\activate.bat
call pip install conan --pre
call pip install cmake

echo -- conan config install
call conan config install %~dp0config\

echo -- conan install with win_visual --build=missing
call conan install . -pr:b win_visual -pr:h win_visual -of=%~dp0.temp --build=missing

echo -- conan install with win_intel
call conan install . -pr:b win_intel -pr:h win_intel -of=%~dp0.temp