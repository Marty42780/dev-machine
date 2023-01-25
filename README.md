# Dev-Machine

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/Marty42780/dev-machine/docker.yml?label=%F0%9F%9A%80%20Docker%20Build%20%26%20Push)

Code inside a docker container with SSH, you can use VSCode, Vim, Nano or any ssh compatible IDE.

+ Shell by default: `Oh My Zsh`.

+ Packages pre-installed: `apt`, `git`, `python`, `pip`, `npm`, `tmux`, `curl`, `wget`, `vim`.

## Installation

Here is an example to get you started with the dev-machine.

### Docker CLI

```Bash
docker run -d \
    --name="Dev Machine" \
    -e zshrc="" \
    -e vimrc="" \
    -e plugdl="" \
    -e gitemail="" \
    -e gitname="" \
    -p 22:22 \
    -p 44:44 \
    -v path/to/workspace:/root/workspace \
    -v path/to/autorized_keys:/root/.ssh/authorized_keys \
    --restart unless-stopped \ 
```
### Parameters

| Parameter   | Usage                                                             |
|-------------|-------------------------------------------------------------------|
| -e zshrc    | URL of your .zshrc (optional)                                     |
| -e vimrc    | URL of your .zshrc (optional)                                     |
| -e plugdl   | URL of the bash script to run to install your zsh and vim plugins |
| -e gitemail |	Your Git email                                                    |
| -e gitname  | Your Git username                                                 |
| -p 22:22    | SSH server port                                                   |
| -p 44:44    | Http File server 						  |

For the url, I recommend hosting the files on a github repo and using the url `raw.githubusercontent.com/...`.

The SSH server is on port 22, I recommend changing the port if you want to open it on the web.

A file-access Web Server is open on port 44, you can open it or forward it in the SSH tunnel as explained [here](https://www.ssh.com/academy/ssh/tunneling-example), next you will be able to browse it throught your ssh session.

