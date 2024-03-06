@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  logging startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and LOGGING_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\logging-0.1-jit.jar;%APP_HOME%\lib\micronaut-serde-jackson-2.8.1.jar;%APP_HOME%\lib\micronaut-serde-support-2.8.1.jar;%APP_HOME%\lib\micronaut-serde-api-2.8.1.jar;%APP_HOME%\lib\micronaut-http-server-netty-4.3.9.jar;%APP_HOME%\lib\micronaut-http-server-4.3.9.jar;%APP_HOME%\lib\micronaut-http-netty-4.3.9.jar;%APP_HOME%\lib\micronaut-router-4.3.9.jar;%APP_HOME%\lib\micronaut-jackson-core-4.3.9.jar;%APP_HOME%\lib\micronaut-json-core-4.3.9.jar;%APP_HOME%\lib\micronaut-http-4.3.9.jar;%APP_HOME%\lib\micronaut-context-propagation-4.3.9.jar;%APP_HOME%\lib\micronaut-context-4.3.9.jar;%APP_HOME%\lib\micronaut-buffer-netty-4.3.9.jar;%APP_HOME%\lib\micronaut-aop-4.3.9.jar;%APP_HOME%\lib\micronaut-inject-4.3.9.jar;%APP_HOME%\lib\logback-classic-1.4.14.jar;%APP_HOME%\lib\jul-to-slf4j-2.0.12.jar;%APP_HOME%\lib\micronaut-core-reactive-4.3.9.jar;%APP_HOME%\lib\micronaut-core-4.3.9.jar;%APP_HOME%\lib\slf4j-api-2.0.12.jar;%APP_HOME%\lib\jackson-annotations-2.16.1.jar;%APP_HOME%\lib\jackson-core-2.16.1.jar;%APP_HOME%\lib\jakarta.annotation-api-2.1.1.jar;%APP_HOME%\lib\netty-codec-http2-4.1.107.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.107.Final.jar;%APP_HOME%\lib\netty-handler-4.1.107.Final.jar;%APP_HOME%\lib\netty-codec-4.1.107.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.107.Final.jar;%APP_HOME%\lib\netty-transport-4.1.107.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.107.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.107.Final.jar;%APP_HOME%\lib\netty-common-4.1.107.Final.jar;%APP_HOME%\lib\reactor-core-3.6.1.jar;%APP_HOME%\lib\reactive-streams-1.0.4.jar;%APP_HOME%\lib\logback-core-1.4.14.jar;%APP_HOME%\lib\jakarta.inject-api-2.0.1.jar


@rem Execute logging
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %LOGGING_OPTS%  -classpath "%CLASSPATH%" com.paymentology.structured.structured.Application %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable LOGGING_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%LOGGING_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
