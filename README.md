# KickStart

Contains resources, workflows and other documents needed to quickly set up a project and to get a team up and running.

## Workflows and Style guides

Documents codifying best practices and codes of conduct for projects using particular platforms or stacks:

- [Git workflow](./CONTRIBUTING/git.md)
- [GitHub workflow](./CONTRIBUTING/github.md)
- [Angular workflow](./CONTRIBUTING/angular.md)

## Configuration and resources

### Operating system(s)

- Windows: [configuration](./ENV/windows.md) and [resources](./RESOURCES/Windows)

- WSL: [configuration](./ENV/wsl.md) and [resources](./RESOURCES/WSL)

### Applications

- Windows Terminal: [resources](./RESOURCES/WindowsTerminal)

- VS Code: [configuration](./ENV/vscode.md) and [resources](./RESOURCES/VSCode)

### Tooling

- JavaScript: [configuration](./ENV/javascript.md) and [resources](./RESOURCES/JavaScript)

- TypeScript: [configuration](./ENV/typescript.md)

- Angular: [configuration](./ENV/angular.md) and [resources](./RESOURCES/Angular)

### GitHub resources

#### Readme

Every project needs a README file. Use this template to get started: [README.md](./RESOURCES/GitHub/README.md)

#### Templates:

GitHub templates can be set by the repository administrator and are a good way of nudging developers to keep consistency in their issue and PR content and formatting:

- [New issue template](./RESOURCES/GitHub/templates/issue.md)
- [New pull request template](./RESOURCES/GitHub/templates/pull-request.md)

#### GitHub Projects Plus browser extension:

The GitHub Projects Plus browser extension updates GitHub's UI to provide you with different types of labels for different purposes. Typically it is good practice to differentiate between following types:

- Domain labels

  > Should all be named starting with a "`#`" character and are used to position an issue or pull request into a certain domain of interest, for example: `#api`, `#webclient`, `#mobile`.

- Status labels

  > Should all be named starting with a "`@`" character and are used to signify current status of an issue or pull request, for example: `@blocked`, `@complete`, `@tested`.

- Descriptor labels

  > All other, ordinary labels, used to further classify and describe an issue or pull request.

You can download the GitHub Projects Plus browser extension here:

- [For Chrome, Chromium and Edge browsers](https://chrome.google.com/webstore/detail/github-projects-plus/pkkhkgaamkjaepakanehpgbifoljadnl)
- [For Firefox browser](https://addons.mozilla.org/en-US/firefox/addon/github-projects-plus/)
