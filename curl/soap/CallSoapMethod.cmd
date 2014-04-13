@echo off

set _method=%1
if [%2]==[fiddler] (set _proxy=-x 127.0.0.1:8888 ) else (set _proxy=)

set _reqxml=.\xmlSamples\%_method%.xml
cls

type %_reqxml%
echo.

rem echo ^
curl %_proxy%^
-X POST ^
-d @"%_reqxml%" ^
-H "Content-Type: text/xml; charset=utf-8" ^
-H "SOAPAction: "http://www.yarratrams.com.au/pidsservice/%_method%"" ^
http://ws.tramtracker.com.au/pidsservice/pids.asmx