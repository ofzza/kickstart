# WSL

## Install WSL

### Install HyperV and WSL Windows feature

...

### Install a WSL distro

...

### Instantiate WSL1 and WSL2 instances

...

## Install dependencies

Install dependencies by running [this script](../RESOURCES/WSL/install-dependencies.sh) inside WSL

## Configuration

First copy the resources from the following directories into your WSL home directory:

- [~](../RESOURCES/WSL/~/bash)
- [~](../RESOURCES/WSL/~/git)
- [~](../RESOURCES/WSL/~/ssh)

### Configure BASH

Edit your `~/.bashrc` configuration file and add following lines at the end:

```sh
# Add personal customizations
if [ -f "$HOME/.bashrc.addendum" ]; then
    . $HOME/.bashrc.addendum
fi
```

Then check and as needed modify the following files:

- [BASH environment variables](../RESOURCES/WSL/~/bash/.bashrc.environment)
- [BASH prompt customization](../RESOURCES/WSL/~/bash/.bashrc.prompt)
- [BASH sync SSH keys from windows](../RESOURCES/WSL/~/bash/.bashrc.sshkeys)

### Configure GIT

Edit your default [git configuration](../RESOURCES/WSL/~/git/.gitconfig)

### Configure SSH

Edit your default [ssh configuration](../RESOURCES/WSL/~/ssh/.ssh/.gitconfig)

### Debugging VS projects from WSL network drive

- Set a windows environment variable pointing to a working directory to be used under windows:
  `WINDOWS_DOTNET_WORKINGDIR = "E:\.vsbuild"`

- For the startup project, set the Working directory to be the newly set `bin` directory of that project. You can do this by setting it as:
  `$(WINDOWS_DOTNET_WORKINGDIR)\\$(SolutionName)\\$(ProjectName)`
