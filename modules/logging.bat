@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
REM ********************************************
REM logging.bat
REM The FROG Brigade dot NET
REM Ver.1.0.0, 2021-11-25
REM --------------------------------------------
REM The module provides a subroutine that echoes the formatted log record.
REM
REM @ARGS[1]
REM Always specified `LOG` to log a message.
REM @ARGS[2]
REM One of the following uppercase letters representing the log level:
REM * `D` - DEBUG
REM * `I` - INFORMATION
REM * `W` - WARNING
REM * `E` - ERROR
REM @ARGS[3]
REM Message to log.
REM ********************************************

IF "%~1"=="LOG" CALL :LOG "%~2" "%~3"
EXIT /B

:LOG
SETLOCAL
SET ASCTIME=%DATE:/=-% %TIME: =0%

IF ""=="%~1" (
ECHO %ASCTIME% [W] No log level specified.
EXIT /B
)

SET LEVELNAME=%~1
SET MESSAGE=%~2

ECHO %ASCTIME% [%LEVELNAME:~0,1%] %MESSAGE%
EXIT /B
