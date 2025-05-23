# Setup Script per Applicazione Python
# Versione PowerShell - Windows
# ===========================================

# Colori per output
$Host.UI.RawUI.WindowTitle = "Setup Applicazione Python"
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host "     SETUP APPLICAZIONE PYTHON" -ForegroundColor Green
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""

# Funzione per richiedere password
function Request-Password {
    Write-Host "Inserisci la password per procedere:" -ForegroundColor Yellow
    $password = Read-Host -AsSecureString
    $plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
    return $plainPassword
}

# Verifica password
$correctPassword = "DDario2021!!"
$enteredPassword = Request-Password

if ($enteredPassword -ne $correctPassword) {
    Write-Host ""
    Write-Host "❌ ACCESSO NEGATO" -ForegroundColor Red
    Write-Host "Password non corretta. Chiusura dello script..." -ForegroundColor Red
    Write-Host ""
    Read-Host "Premi INVIO per chiudere"
    exit 1
}

Write-Host ""
Write-Host "✅ Password corretta! Proseguendo con l'installazione..." -ForegroundColor Green
Write-Host ""

# Verifica prerequisiti
Write-Host "🔍 Verifica prerequisiti..." -ForegroundColor Yellow

# Verifica Git
try {
    $gitVersion = git --version 2>$null
    Write-Host "✅ Git trovato: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git non trovato. Installare Git da https://git-scm.com/" -ForegroundColor Red
    Read-Host "Premi INVIO per chiudere"
    exit 1
}

# Verifica Python
try {
    $pythonVersion = python --version 2>$null
    Write-Host "✅ Python trovato: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Python non trovato. Installare Python da https://python.org/" -ForegroundColor Red
    Read-Host "Premi INVIO per chiudere"
    exit 1
}

# Creazione directory di lavoro
$workDir = ".\mia-app-python"
Write-Host ""
Write-Host "📁 Preparazione directory di lavoro..." -ForegroundColor Yellow

if (Test-Path $workDir) {
    Write-Host "⚠️  Directory esistente trovata. Rimuovo la vecchia installazione..." -ForegroundColor Orange
    Remove-Item -Recurse -Force $workDir
}

# Download dell'applicazione da GitHub
Write-Host ""
Write-Host "⬇️  Download applicazione da GitHub..." -ForegroundColor Yellow
$repoUrl = "https://github.com/mio-utente/mia-app"

try {
    git clone $repoUrl $workDir
    Write-Host "✅ Download completato con successo!" -ForegroundColor Green
} catch {
    Write-Host "❌ Errore durante il download. Verifica la connessione internet e l'URL del repository." -ForegroundColor Red
    Read-Host "Premi INVIO per chiudere"
    exit 1
}

# Spostamento nella directory dell'app
Set-Location $workDir

# Creazione ambiente virtuale
Write-Host ""
Write-Host "🐍 Creazione ambiente virtuale Python..." -ForegroundColor Yellow

try {
    python -m venv venv
    Write-Host "✅ Ambiente virtuale creato!" -ForegroundColor Green
} catch {
    Write-Host "❌ Errore nella creazione dell'ambiente virtuale." -ForegroundColor Red
    Set-Location ..
    Read-Host "Premi INVIO per chiudere"
    exit 1
}

# Attivazione ambiente virtuale
Write-Host ""
Write-Host "🔌 Attivazione ambiente virtuale..." -ForegroundColor Yellow

try {
    .\venv\Scripts\Activate.ps1
    Write-Host "✅ Ambiente virtuale attivato!" -ForegroundColor Green
} catch {
    Write-Host "❌ Errore nell'attivazione dell'ambiente virtuale." -ForegroundColor Red
    Set-Location ..
    Read-Host "Premi INVIO per chiudere"
    exit 1
}

# Installazione dipendenze
Write-Host ""
Write-Host "📦 Installazione dipendenze..." -ForegroundColor Yellow

if (Test-Path "requirements.txt") {
    try {
        pip install -r requirements.txt
        Write-Host "✅ Dipendenze installate con successo!" -ForegroundColor Green
    } catch {
        Write-Host "❌ Errore nell'installazione delle dipendenze." -ForegroundColor Red
        Set-Location ..
        Read-Host "Premi INVIO per chiudere"
        exit 1
    }
} else {
    Write-Host "⚠️  File requirements.txt non trovato. Salto l'installazione delle dipendenze." -ForegroundColor Orange
}

# Verifica presenza main.py
Write-Host ""
Write-Host "🔍 Verifica file principale..." -ForegroundColor Yellow

if (Test-Path "main.py") {
    Write-Host "✅ File main.py trovato!" -ForegroundColor Green
    
    # Avvio dell'applicazione
    Write-Host ""
    Write-Host "🚀 Avvio dell'applicazione..." -ForegroundColor Yellow
    Write-Host "===========================================" -ForegroundColor Cyan
    Write-Host ""
    
    try {
        python main.py
    } catch {
        Write-Host ""
        Write-Host "❌ Errore durante l'esecuzione dell'applicazione." -ForegroundColor Red
    }
} else {
    Write-Host "⚠️  File main.py non trovato nella directory. Verifica il repository." -ForegroundColor Orange
}

# Messaggio finale
Write-Host ""
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host "🎉 INSTALLAZIONE COMPLETATA CON SUCCESSO!" -ForegroundColor Green
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "L'applicazione è stata configurata e avviata." -ForegroundColor White
Write-Host "Per avviarla nuovamente in futuro:" -ForegroundColor White
Write-Host "1. Vai nella cartella: cd $workDir" -ForegroundColor Gray
Write-Host "2. Attiva l'ambiente: .\venv\Scripts\Activate.ps1" -ForegroundColor Gray
Write-Host "3. Avvia l'app: python main.py" -ForegroundColor Gray
Write-Host ""

# Torna alla directory principale
Set-Location ..

Read-Host "Premi INVIO per chiudere" 