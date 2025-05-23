@echo off
REM Setup Script per Applicazione Python
REM Versione Batch - Windows
REM ===========================================

title Setup Applicazione Python
echo ==========================================
echo      SETUP APPLICAZIONE PYTHON
echo ==========================================
echo.

REM Richiesta password
:password_prompt
set /p "user_password=Inserisci la password per procedere: "

REM Verifica password
if "%user_password%"=="DDario2021!!" (
    echo.
    echo [32m✅ Password corretta! Proseguendo con l'installazione...[0m
    echo.
    goto :continue_setup
) else (
    echo.
    echo [31m❌ ACCESSO NEGATO[0m
    echo Password non corretta. Chiusura dello script...
    echo.
    pause
    exit /b 1
)

:continue_setup
REM Verifica prerequisiti
echo [33m🔍 Verifica prerequisiti...[0m

REM Verifica Git
git --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [32m✅ Git trovato![0m
) else (
    echo [31m❌ Git non trovato. Installare Git da https://git-scm.com/[0m
    pause
    exit /b 1
)

REM Verifica Python
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [32m✅ Python trovato![0m
) else (
    echo [31m❌ Python non trovato. Installare Python da https://python.org/[0m
    pause
    exit /b 1
)

REM Preparazione directory di lavoro
set "work_dir=mia-app-python"
echo.
echo [33m📁 Preparazione directory di lavoro...[0m

if exist "%work_dir%" (
    echo [33m⚠️  Directory esistente trovata. Rimuovo la vecchia installazione...[0m
    rmdir /s /q "%work_dir%"
)

REM Download dell'applicazione da GitHub
echo.
echo [33m⬇️  Download applicazione da GitHub...[0m
set "repo_url=https://github.com/mio-utente/mia-app"

git clone "%repo_url%" "%work_dir%"
if %errorlevel% equ 0 (
    echo [32m✅ Download completato con successo![0m
) else (
    echo [31m❌ Errore durante il download. Verifica la connessione internet e l'URL del repository.[0m
    pause
    exit /b 1
)

REM Spostamento nella directory dell'app
cd "%work_dir%"

REM Creazione ambiente virtuale
echo.
echo [33m🐍 Creazione ambiente virtuale Python...[0m

python -m venv venv
if %errorlevel% equ 0 (
    echo [32m✅ Ambiente virtuale creato![0m
) else (
    echo [31m❌ Errore nella creazione dell'ambiente virtuale.[0m
    cd ..
    pause
    exit /b 1
)

REM Attivazione ambiente virtuale
echo.
echo [33m🔌 Attivazione ambiente virtuale...[0m

call venv\Scripts\activate.bat
if %errorlevel% equ 0 (
    echo [32m✅ Ambiente virtuale attivato![0m
) else (
    echo [31m❌ Errore nell'attivazione dell'ambiente virtuale.[0m
    cd ..
    pause
    exit /b 1
)

REM Installazione dipendenze
echo.
echo [33m📦 Installazione dipendenze...[0m

if exist "requirements.txt" (
    pip install -r requirements.txt
    if %errorlevel% equ 0 (
        echo [32m✅ Dipendenze installate con successo![0m
    ) else (
        echo [31m❌ Errore nell'installazione delle dipendenze.[0m
        cd ..
        pause
        exit /b 1
    )
) else (
    echo [33m⚠️  File requirements.txt non trovato. Salto l'installazione delle dipendenze.[0m
)

REM Verifica presenza main.py
echo.
echo [33m🔍 Verifica file principale...[0m

if exist "main.py" (
    echo [32m✅ File main.py trovato![0m
    
    REM Avvio dell'applicazione
    echo.
    echo [33m🚀 Avvio dell'applicazione...[0m
    echo ==========================================
    echo.
    
    python main.py
    if not %errorlevel% equ 0 (
        echo.
        echo [31m❌ Errore durante l'esecuzione dell'applicazione.[0m
    )
) else (
    echo [33m⚠️  File main.py non trovato nella directory. Verifica il repository.[0m
)

REM Messaggio finale
echo.
echo ==========================================
echo [32m🎉 INSTALLAZIONE COMPLETATA CON SUCCESSO![0m
echo ==========================================
echo.
echo L'applicazione è stata configurata e avviata.
echo Per avviarla nuovamente in futuro:
echo 1. Vai nella cartella: cd %work_dir%
echo 2. Attiva l'ambiente: call venv\Scripts\activate.bat
echo 3. Avvia l'app: python main.py
echo.

REM Torna alla directory principale
cd ..

pause 