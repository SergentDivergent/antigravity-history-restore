# 🚀 Antigravity IDE Chat & History Migrator

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Windows-blue.svg)](https://www.microsoft.com/windows)
[![IDE Support](https://img.shields.io/badge/IDE-Antigravity%20IDE-purple.svg)](https://antigravity.dev)

Did you upgrade your **Antigravity IDE** and realize your previous chat history and workspace settings are gone? 

This lightweight, open-source utility script safely migrates your local SQLite chat database (`state.vscdb`) and project-specific histories (`workspaceStorage`) from the legacy configuration directory to the new Antigravity IDE path.

---

## 🔍 How it Works

When upgrading, the IDE directory structure changes. This script automates the transition safely:
1. **Creates Backups First**: Backs up your new configuration files (`*.backup_new`) before overwriting anything.
2. **Migrates Chat History**: Copies `state.vscdb` containing all your AI chat history.
3. **Migrates Workspace History**: Copies `workspaceStorage` containing your recently opened files, editor states, and folder configurations.

---

## 🛠️ Step-by-Step Guide

> [!IMPORTANT]
> You **must** completely close Antigravity IDE before running this script to prevent database file locking and data corruption.

### Option 1: Quick Download (Recommended)
1. Download [migrate.bat](https://raw.githubusercontent.com/SergentDivergent/antigravity-history-restore/main/migrate.bat) directly.
2. Place it on your Desktop or any folder.
3. Fully close Antigravity IDE.
4. Double-click `migrate.bat` and follow the on-screen prompts.

### Option 2: Manual Setup
1. Create a new text file on your PC and name it `migrate.bat`. *(Make sure file extensions are visible, so it's not named `migrate.bat.txt`)*.
2. Right-click the file, select **Edit**, and paste the script code found in this repository.
3. Save and close the file.
4. Run it by double-clicking.

---

## 🛡️ Privacy & Security

* **Zero Personal Data**: The script uses standard Windows environment variables (`%APPDATA%`). It **never** hardcodes or exposes your username, system path, or project names.
* **100% Local**: No internet connection required, and no data leaves your machine.

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.
