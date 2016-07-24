@echo off

REM Either drag & drop the folder(s)/file(s) onto the bat or put this into your "send to" folder (Win+R, type "shell:sendto")

REM Requirements: 
REM - node: https://nodejs.org/
REM - create-torrent: https://github.com/feross/create-torrent

REM Installation:
REM 1. Download and install node 
REM 2. Open cmd, navigate to the location you want to save 'create-torrent' and type 'npm install create-torrent'
REM 3. Adjust the path in the setting below to your 'create-torrent' location

REM Usage: create-torrent <directory OR file> [OPTIONS]
REM -o, --outfile    Output file. If not specified, stdout is used [string]
REM -n, --name       Torrent name [string]
REM --creationDate   Creation date [Date]
REM --comment        Torrent comment [string]
REM --createdBy      Created by client [string]
REM --private        Private torrent? [boolean] [default: false]
REM --pieceLength    Piece length [number] [default: reasonable length]
REM --announce       Tracker url [string] [default: reasonable trackers]
REM --urlList        Web seed url [string]

REM Set your path
set create-torrent=node "C:\YOURPATH\node_modules\create-torrent\bin\cmd.js"

echo 1) AniDex + Minglong
echo 2) AniDex
echo 3) Nyaa
echo 4) BakaBT
echo 5) AsianDVDClub

echo.
set /p target_tracker=Choose Tracker: 
echo.

:loop
echo Hashing "%~nx1"
if %target_tracker%==1 %create-torrent% "%~1" --announce "http://anidex.moe:6969/announce" --announce "http://tracker.minglong.org:8080/announce" -o "%~1.torrent"
if %target_tracker%==2 %create-torrent% "%~1" --announce "http://anidex.moe:6969/announce" -o "%~1.torrent"
if %target_tracker%==3 %create-torrent% "%~1" --announce "http://open.nyaatorrents.info:6544/announce" -o "%~1.torrent"
if %target_tracker%==4 %create-torrent% "%~1" --announce "http://tracker.bakabt.me:2710/announce.php" --private -o "%~1.torrent"
if %target_tracker%==5 %create-torrent% "%~1" --announce "http://announce.asiandvdclub.org/" --private -o "%~1.torrent"
shift
if not "%~1"=="" goto :loop

REM pause