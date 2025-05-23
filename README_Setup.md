# 🚀 Setup Automatico Applicazione Python

Questo repository contiene script automatici per il setup di applicazioni Python su Windows.

## 📋 Prerequisiti

Prima di eseguire gli script, assicurati di avere installato:

- **Git**: Scarica da [https://git-scm.com/](https://git-scm.com/)
- **Python 3.7+**: Scarica da [https://python.org/](https://python.org/)

## 🔧 Script Disponibili

### 1. PowerShell Script (`setup_app.ps1`) - **CONSIGLIATO**
- Versione moderna con interfaccia colorata
- Migliore gestione degli errori
- Supporto per password sicure

### 2. Batch Script (`setup_app.bat`)
- Compatibilità universale con tutti i sistemi Windows
- Funziona anche su versioni più vecchie di Windows

## 🚀 Come Utilizzare

### Metodo 1: PowerShell (Consigliato)

1. **Clicca destro** sulla cartella dove vuoi installare l'app
2. Seleziona **"Apri in PowerShell"** o **"Apri finestra PowerShell qui"**
3. Esegui il comando:
   ```powershell
   .\setup_app.ps1
   ```
4. Se appare un errore di policy, esegui prima:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

### Metodo 2: Batch

1. **Doppio clic** sul file `setup_app.bat`
2. Oppure apri il **Prompt dei comandi** e naviga nella cartella
3. Esegui:
   ```cmd
   setup_app.bat
   ```

## 🔐 Autenticazione

Lo script richiederà una password prima di procedere:
- **Password**: `DDario2021!!`
- Se la password è sbagliata, lo script si chiuderà automaticamente

## 📂 Cosa Fa lo Script

1. ✅ **Verifica password** - Controllo accesso sicuro
2. 🔍 **Controlla prerequisiti** - Git e Python installati
3. ⬇️ **Scarica l'app** - Clone da GitHub del repository
4. 📁 **Crea ambiente virtuale** - Isolamento delle dipendenze
5. 📦 **Installa dipendenze** - Da file `requirements.txt`
6. 🚀 **Avvia l'applicazione** - Esegue `main.py`

## 📍 Configurazione

### Personalizzare l'URL del Repository

Per utilizzare un repository diverso, modifica questa riga negli script:

**PowerShell:**
```powershell
$repoUrl = "https://github.com/TUO-UTENTE/TUA-APP"
```

**Batch:**
```cmd
set "repo_url=https://github.com/TUO-UTENTE/TUA-APP"
```

### Personalizzare la Password

Modifica questa riga negli script:

**PowerShell:**
```powershell
$correctPassword = "TUA_NUOVA_PASSWORD"
```

**Batch:**
```cmd
if "%user_password%"=="TUA_NUOVA_PASSWORD" (
```

## 🎯 Struttura Repository Richiesta

Il repository GitHub deve contenere:
```
repository/
├── main.py              # File principale dell'applicazione
├── requirements.txt     # Dipendenze Python (opzionale)
└── ...                 # Altri file dell'app
```

## 🔄 Utilizzo Futuro

Dopo la prima installazione, per avviare nuovamente l'app:

```cmd
cd mia-app-python
call venv\Scripts\activate.bat
python main.py
```

Oppure in PowerShell:
```powershell
cd mia-app-python
.\venv\Scripts\Activate.ps1
python main.py
```

## ⚠️ Risoluzione Problemi

### Script PowerShell non si esegue
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Git o Python non trovati
- Verifica che siano installati e aggiunti al PATH di sistema
- Riavvia il terminale dopo l'installazione

### Errore di connessione GitHub
- Verifica la connessione internet
- Controlla che l'URL del repository sia corretto e pubblico

### Directory già esistente
- Lo script rimuove automaticamente installazioni precedenti
- Se persistono problemi, elimina manualmente la cartella `mia-app-python`

## 📞 Supporto

Per problemi o domande:
1. Verifica che tutti i prerequisiti siano installati
2. Controlla che l'URL del repository sia corretto
3. Assicurati di avere i permessi per scrivere nella directory

---

**Nota**: Questi script sono ottimizzati per utenti non esperti e includono controlli automatici di sicurezza e validazione. 