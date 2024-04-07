# GitHub Codespaces

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/joshooaj/docs-workshop?quickstart=1)

The easiest way for you to follow along during the workshop is to login to GitHub,
[fork this repository](https://github.com/joshooaj/docs-workshop/fork), and start a GitHub Codespace. This will give
you a clean development environment that you can access in a browser, or remotely through VSCode. That way you don't
have to worry about downloading and installing dependencies, or risk running into problems with those dependencies on
your computer.

I don't think you should see any cost billed to you by GitHub for the use of codespaces during this workshop as you get
up to 60 hours free/month. If you exceed your monthly credit, it would still be a _very small_ amount of money to use
codespaces for this workshop. A [quick calculation](https://github.com/pricing/calculator) shows a potential cost of
only ~$0.85 based on 4 hours total usage.

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
