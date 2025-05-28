echo call config/build_json.bat...
cd config
call build_json.bat
if %ERRORLEVEL% neq 0 (
    echo Error occurred while executing config/build_json.bat
    pause
    exit /b %ERRORLEVEL%
) else (
    echo config/build_json.bat executed successfully!
    cd ../
    hookTool.exe --config config.yml
    pause
)
exit