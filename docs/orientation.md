---
title: Orientation
---

# Scaffolding

![Screenshot of PowerShell terminal with the output of Find-DadJoke](../../assets/images/trowel.png){align="right" width="150"}
  
The structure of this module and repository was scaffolded using [PSStucco](https://github.com/jimbrig/PSStucco) by
Jimmy Briggs, who forked and improved upon the original [Stucco](https://github.com/devblackops/Stucco) module by
Brandon Olin. The Stucco module is a [Plaster Template](https://github.com/PowerShellOrg/Plaster/blob/master/docs/en-US/about_Plaster.help.md)
and if you haven't heard of Plaster yet, you might enjoy reading about it.  It's a great little PowerShell framework
which enables you to create flexible templates using an XML document.  

## Structure

### Sample Module

There is a functional DadJokes module in this repository. You can import it directly with
`Import-Module docs-workshop/docs-workshop.psd1`, or you can "build" the module by running `./build.ps1`.

![Screenshot of PowerShell terminal with the output of Find-DadJoke](../../assets/images/find-dadjoke.png)

### Files and Folders

| Path                          | Description |
| ----------------------------- | ----------- |
| .cache/                       | Temporary files when using certain MkDocs plugins as well as a place to cache the dotnet CLI. |
| .config/dotnet-tools.json     | Configuration file for the dotnet CLI used with `dotnet tool restore` to install the NerdbankGitVersioning tool.  |
| .devcontainer/                | Optional (recommended) devcontainer configuration for this workshop. Use the devcontainer locally, or using GitHub codespaces. |
| .github/workflows             | Workflow files describing when and how GitHub Actions should build the module and documentation. |
| .vscode/                      | VSCode configuration files to help normalize the development environment between different users and machines. |
| docs/                         | Source folder for markdown files and assets to be rendered into a static website. |
| docs-workshop/                | Contains the source for a sample DadJokes module. |
| Output/                       | When running `build.ps1`, the "compiled" PowerShell module will be placed here. |
| sandbox/                      | An empty folder used as a sandbox for following along during the workshop. Have fun and experiment! |
| tests/                        | Pester tests go here. There are a few, but it was not a priority for this workshop. |
| .gitattributes                | Helps ensure line endings don't become a never-ending source of senseless commits. |
| .gitignore                    | Prevents git from detecting changes in folders like `.cache/` and `Output/`. |
| .markdownlint.json            | Rules used with the `markdownlint` VSCode extension. There are certain default markdown linting rules I want to modify/ignore. |
| build.ps1                     | Intended as the entrypoint for all build and CI/CD tasks whether it is being executed by a developer or by the pipeline. This ensures the environment is ready to build before invoking psake. |
| LICENSE                       | MIT license |
| mkdocs.yml                    | MkDocs configuration file. Describes the site to be built, and the theme, plugins, configuration, and options unique to this project. |
| psakeFile.ps1                 | Called by `build.ps1` using the psake module. Contains build configuration and tasks used for initializing, building, testing, and generating documentatation. |
| PSScriptAnalyzerSettings.psd1 | Used to configure PSScriptAnalyzer to limit nuissance warnings. |
| requirements.psd1             | Describes dependencies that the PSDepend module should ensure are in place before performing a build. |
| requirements.txt              | Describes Python requirements installed with the `pip` CLI. |
| run.ps1                       | A simple script to use as an entrypoint for interactive debugging. |
| version.json                  | The configuration file used by the [Nerdbank.GitVersioning](https://github.com/dotnet/Nerdbank.GitVersioning) dotnet tool. It describes how the module version is determined based on the git commit height. |

## Additional modules and tools

Additional modules and tools used in this repository include:

| Module              | Purpose                                                                                              |
| --------------------| ---------------------------------------------------------------------------------------------------- |
| BuildHelpers        | Initializes a collection of useful environment variables prefixed with "BH" used during builds       |
| dotnet CLI          | The dotnet CLI is used to install and use the Nerdbank.GitVersioning CLI.                            |
| GitHub              | Besides version control and ease of collaboration, it also provides codespaces and build automation. |
| Material for MkDocs | My prefered MkDocs theme for pretty much anything.                                                   |
| MkDocs              | The python-based static site generator tool used to build a static website from markdown files.      |
| Pester              | The defacto standard testing framework for PowerShell                                                |
| PlatyPS             | Creates/Updates markdown files based on PowerShell command documentation returned by `Get-Help`      |
| PowerShellBuild     | Includes a collection of common psake tasks I use in a variety of PowerShell projects for CI/CD      |
| psake               | A great way to define and run build tasks                                                            |
| PSDepend            | Uses `requirements.psd1` to help bootstrap environment for development or CI/CD                      |
| VSCode              | Kind of the bees knees when it comes to code editing in PowerShell and lots of other languages.      |
