# VS Code setup

## Install extensions

Install the following VS Code extensions:

### Code-Style extensions

- #### Prettier

Auto-formats syntax for multiple languages (on file save).

The extension is (pre)configured by placing [.prettierrc](../RESOURCES/JavaScript/.prettierrc) and [.prettierignore](../RESOURCES/JavaScript/.prettierignore) files into a project directory.

Install this extension from within VS Code by searching for "`Prettier`".

More on the extension can be found [here](https://github.com/prettier/prettier-vscode.git).

- #### ESLint

Highlights JavaScript code-style errors inside the IDE.

The extension is (pre)configured by placing a [.eslintrc](../RESOURCES/JavaScript/.eslintrc) file into a project directory.

Install this extension from within VS Code by searching for "`ESLint`".

More on the extension can be found [here](https://github.com/Microsoft/vscode-eslint).

- #### Code spell checker

Checks english spelling and highlights errors.

The extension is (pre)configured in [Workspace VS Code settings](../RESOURCES/VSCode/settings.json) provided below under the key `cSpell`.

Install this extension from within VS Code by searching for "`Code spell checker`".

More on the extension can be found [here](https://github.com/streetsidesoftware/vscode-spell-checker).

- #### TODO Highlights

Highlights certain keywords like "TODO", "FIXME" and "DOCS" allowing them to stand out in a code base.

The extension is (pre)configured in [Global VS Code settings](../RESOURCES/VSCode/settings.json) provided below under the key `todohighlight`.

Install this extension from within VS Code by searching for "`TODO Highlights`".

More on the extension can be found [here](https://github.com/wayou/vscode-todo-highlight.git).

- #### Markdown Checkboxes

Makes markdown syntax (`- [ ] Item`) render as as checkbox, same as it would on GitHub.

Install this extension from within VS Code by searching for "`Markdown Checkboxes`".

More on the extension can be found [here](https://github.com/formulahendry/vscode-auto-rename-tag).

- #### Auto Rename Tag

Automatically renames closing XML/HTML tags as you rename the opening tag.

Install this extension from within VS Code by searching for "`Auto Rename Tag`".

More on the extension can be found [here](https://github.com/formulahendry/vscode-auto-rename-tag).

### Remote-ing and execution extensions

- #### Remote WSL

Allows running VScode inside the WSL context by running CLI command `code .` inside WSL instance. This makes sure all debugging and other context sensitive actions are executed directly inside WSL, and not under Windows.

Install this extension from within VS Code by searching for "`Remote - WSL`".

More on the extension can be found [here](https://code.visualstudio.com/docs/remote/remote-overview).

- #### Live Server

Runs a web server instance serving up the working directory with full support for live reload.

Install this extensions from within VS Code by searching for "`Live Server`".

More on the extension can be found [here](https://github.com/ritwickdey/vscode-live-server.git).

- #### Live Share

Opens a shared collaborative session between remote VSCode users.

Install this extensions from within VS Code by searching for "`Live Share`".

More on the extension can be found [here](https://docs.microsoft.com/en-us/visualstudio/liveshare/).

- #### REST Client

Adds interactive support for `.http` files in which it'll allow you to specify and execute HTTP requests. This can be used as live API documentation.

Install this extensions from within VS Code by searching for "`REST Client`".

More on the extension can be found [here](https://github.com/Huachao/vscode-restclient.git).

- #### Quokka.js

When running against a file, provides instant, runtime like, evaluation of in-code values. Great for quick prototyping.

Install this extensions from within VS Code by searching for "`Quokka.js`".

More on the extension can be found [here](https://quokkajs.com/docs/).

## SUpport printing

Adds a print button for code files and markdown files.

Install this extension within VS Code by searching for "`Print`".

More on the extension can be found [here](https://github.com/PDConSec/vsc-print).

## Install font with ligatures

Optionally install an alternative monospaced FiraCode font with coding friendly ligatures from [here](https://github.com/tonsky/FiraCode).
To enable the usage of this font in VS Code change your settings:

```
"editor.fontFamily": "Fira Code, Consolas, 'Courier New', monospace, 'Segoe UI Emoji'"
```

or if you're using settings supplied here, you don't need to do anything.

## Configure settings

Use VS Code settings supplied here to either copy and overwrite your local settings or to inform changes you need to make:

- [Global VS Code settings](../RESOURCES/VSCode/settings.json)
- [Custom VS Code keybindings](../RESOURCES/VSCode/keybindings.json)
