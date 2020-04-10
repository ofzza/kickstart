# Install WSL(2)
# ---------------------------------------------

# Install WSL subsystem:
winget install Canonical.Ubuntu.2004
wsl --install --distribution ubuntu
# Requires admin shell

# Move WSL Ubuntu distribution "VM"
wsl --export Ubuntu wsl-ubuntu
wsl --unregister Ubuntu
wsl --import Ubuntu d:\.vms\wsl .\wsl-ubuntu --version 2

# Mount WSL FS as network drive
# .wsl
# .wsl/~
# .wsl/projects


### Install Windows Apps
# ---------------------------------------------

# Install Windows terminal:
winget install Microsoft.WindowsTerminal

# Chrome
winget install Google.Chrome

# Firefox
winget install Mozilla.Firefox

# Slack
winget install SlackTechnologies.Slack

# Notepad++
winget install Notepad++.Notepad++

# Git (`./winget/git-git.inf` required)
winget install git.git --override "/VERYSILENT /LOADINF=winget/git-git.inf"

# Install VS Code:
winget install Microsoft.VisualStudioCode --override "/VERYSILENT /MERGETASKS=!runcode,addcontextmenufiles,addcontextmenufolders"

# VisualStudio Community
winget install Microsoft.VisualStudio.2022.Community --interactive

# 7Zip
winget install 7zip.7zip

# TablePlus
winget install TablePlus.TablePlus
