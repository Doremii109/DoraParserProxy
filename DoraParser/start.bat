@echo off
chcp 65001
REM Находим и переходим в текущий каталог
cd /d %~dp0

REM Попытка использовать Python из PATH
where python >nul 2>&1
IF ERRORLEVEL 1 (
    echo Python не найден в PATH.
    set /p PYTHON_EXEC=Пожалуйста введите полный путь к python.exe версии 3.12.6:
    IF NOT EXIST "%PYTHON_EXEC%" (
        echo Путь неверный.
        pause
        exit /b 1
    )
) ELSE (
    set PYTHON_EXEC=python
)

REM Проверка наличия скрипта
IF NOT EXIST "DoraParserProxy-1.0.2.py" (
    echo Скрипт DoraParserProxy-1.0.2.py не найден в текущей директории.
    pause
    exit /b 1
)

REM Запуск скрипта
"%PYTHON_EXEC%" "DoraParserProxy-1.0.2.py"
pause