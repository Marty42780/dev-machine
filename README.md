DEV-Machine
===========

Docker Countainer to code remotly with SSH on vscode, vi, vim, nano or any ssh-compatible ide.

SSH default port in 22 in the container, I recommand you to change the port if you open it to WAN.

Shell by default: `Oh My Zsh`

Packages pre-installed: `apt`, `git`, `python`, `pip`, `npm`, `tmux`, `curl`, `wget`, `vim`

A file-access Web Server is open on port 22001.

Ligne présente dans .zshrc à ajouter si des bugs d'affichages subsistent: `export LC_ALL=en_IN.UTF-8`.
