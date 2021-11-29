# windows-command-logger

This project supplies logging subroutine for Windows batch scripting.

## Requirements

windows-command-logger works on Windows versions:

* Windows Server 2008 and later
* Windows 8.1 and later

## Usage

Simply call logging.bat with "LOG" as the first argument, the log level as the second argument, and the log message as the third argument.

```bat
> SET LOG=CALL modules\logging.bat LOG
> %LOG% D "This is DEBUG level log message."
2021-11-29 08:52:35.65 [D] This is DEBUG level log message.
> %LOG% I "This is INFO level log message."
2021-11-29 08:53:02.41 [I] This is INFO level log message.
> %LOG% W "This is WARNING level log message."
2021-11-29 08:53:12.89 [W] This is WARNING level log message.
> %LOG% E "This is ERROR level log message."
2021-11-29 08:53:24.36 [E] This is ERROR level log message.
> %LOG% ANY_LOG_LEVEL "This is ANY LOG LEVEL log message."
2021-11-29 08:54:42.34 [A] This is ANY LOG LEVEL log message.
```

This logging subroutine just echoes the formatted log message to standard output.
If you need to write a log record to a file, you need to redirect the formatted log message to the file.

```bat
SET LOG=CALL modules\logging.bat LOG
SET LOG_FILE=log-file-%DATE:/=%.log
%LOG% I "This log message is redirected to the log file." >>%LOG_FILE%
```

## Author

* [Nobuyuki Sekimori](https://github.com/juno-rmks)

## License

windows-command-logger is released under the Apache License. See our [LICENSE](./LICENSE) file for details.
