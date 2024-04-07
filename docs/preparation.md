# GitHub Codespaces

The easiest way for you to follow along during the workshop is to login to GitHub,
[fork this repository](https://github.com/joshooaj/docs-workshop/fork), and start a GitHub Codespace. This will give
you a clean development environment that you can access in a browser, or remotely through VSCode. That way you don't
have to worry about downloading and installing dependencies, or risk running into problems with those dependencies on
your computer.

I don't think you should see any cost billed to you by GitHub for the use of codespaces during this workshop. However,
if you are concerned about it, I'll be happy to add you as a collaborator on the repository during the workshop. All I
need is your GitHub username.

## Devcontainer

Optionally, you can spin up a copy of the exact same environment you get with GitHub Codespaces on your local machine
using VSCode and Microsoft's Dev Containers extension. You will need to have a container runtime installed like Docker,
Podman, or containerd.

## Dependencies

While I'm unable to assist in the limited time available during the workshop, you can install all the dependencies
directly on your computer or a virtual machine. They include:

- PowerShell 5.1 or greater
- Python 3.11 or thereabouts
- Python package installer (pip)

I believe with these dependencies in place, you should be able to run `./build.ps1 -Task Init -Bootstrap` and the build
script will install and run the PSDepend module from PSGallery which will install the remaining prerequisites described
in the `requirements.psd1` and `requirements.txt` files.
