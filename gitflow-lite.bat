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
        REM NO tocamos main: solo merge a develop y avisamos
        git checkout develop
        git pull origin develop
        git merge release/%NAME%
        git tag -a %NAME% -m "Release %NAME%"
        git push origin develop --tags
        git branch -d release/%NAME%
        git push origin --delete release/%NAME%
        echo ============================================================
        echo ✅ ¡Release finalizado! Ahora solicita un Pull Request
        echo    de develop -> main para publicar en producción.
        echo ============================================================
    )
)

if "%TYPE%"=="hotfix" (
    if "%ACTION%"=="start" (
        REM Creamos el hotfix desde develop (ya que no tenemos acceso a main)
        git checkout develop
        git pull origin develop
        git checkout -b hotfix/%NAME%
    ) else if "%ACTION%"=="finish" (
        git checkout develop
        git pull origin develop
        git merge hotfix/%NAME%
        git tag -a %NAME% -m "Hotfix %NAME%"
        git push origin develop --tags
        git branch -d hotfix/%NAME%
        git push origin --delete hotfix/%NAME%
        echo ============================================================
        echo ✅ ¡Hotfix finalizado! Ahora solicita un Pull Request
        echo    de develop -> main para publicar en producción.
        echo ============================================================
    )
)

endlocal
