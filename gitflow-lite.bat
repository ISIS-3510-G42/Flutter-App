@echo off
setlocal

REM === GitFlow Lite Script (solo release y hotfix) ===
REM Uso: gitflow-lite.bat release start v1.0.0
REM       gitflow-lite.bat release finish v1.0.0
REM       gitflow-lite.bat hotfix start v1.0.1
REM       gitflow-lite.bat hotfix finish v1.0.1

set TYPE=%1
set ACTION=%2
set NAME=%3

if "%TYPE%"=="release" (
    if "%ACTION%"=="start" (
        git checkout develop
        git pull origin develop
        git checkout -b release/%NAME%
    ) else if "%ACTION%"=="finish" (
        git checkout main
        git pull origin main
        git merge release/%NAME%
        git tag -a %NAME% -m "Release %NAME%"
        git push origin main --tags
        git checkout develop
        git merge release/%NAME%
        git push origin develop
        git branch -d release/%NAME%
        git push origin --delete release/%NAME%
    )
)

if "%TYPE%"=="hotfix" (
    if "%ACTION%"=="start" (
        git checkout main
        git pull origin main
        git checkout -b hotfix/%NAME%
    ) else if "%ACTION%"=="finish" (
        git checkout main
        git pull origin main
        git merge hotfix/%NAME%
        git tag -a %NAME% -m "Hotfix %NAME%"
        git push origin main --tags
        git checkout develop
        git pull origin develop
        git merge hotfix/%NAME%
        git push origin develop
        git branch -d hotfix/%NAME%
        git push origin --delete hotfix/%NAME%
    )
)

endlocal
