# windows-dev-box

This repository contains scripts used to deploy and upgrade an Elhub Windows developer PC.

These scripts are inspired by the [Microsoft Windows Dev Box setup scripts](https://github.com/microsoft/windows-dev-box-setup-scripts) and 
leverage two popular open source projects:

* Boxstarter [boxstarter.org](http://boxstarter.org)
* Chocolatey [chocolatey.org](http://chocolatey.org)

Boxstarter is a wrapper for Chocolatey that handles features like managing reboots and other issues. We use the 
Boxstarter web launcher to start the installation process.

The scripts are intended to be idempotent; i.e., you should be able to rerun these scripts at any time to
repair/update the settings and applications on your PC. 

## Getting started

### Prerequisities

* A clean Windows 10 PC or one installed using this script. 
* Local Administrator rights on the PC

### Installing

To run a recipe, simply click the corresponding link in the table below on your target machine. This will download
the Boxstarter application, and prompt you to run with Administrator privileges. You can then leave the machine to
work for a while and come back when it's finished.

To run a recipe script, click a link in the table below from your target machine. This will download the Boxstarter one-click application, and prompt you for Boxstarter to run with Administrator privileges (which it needs to do its job). Clicking yes in this dialog will cause the recipe to begin. You can then leave the job unattended and come back when it's finished.

|Click link to run  |Description  |
|---------|---------|
|<a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/elhub/windows-dev-box/master/Install-DevBox.ps1'>Elhub DevBox</a>     | Java Development Environment for Windows (JDK, IntelliJ IDEA, etc) |

**Further Steps**

1. The file setup installs WSL with Ubuntu, but the default installation only sets up a root user with a blank
password. You must manually create a non-root user via `$ sudo adduser [USERNAME] sudo` with a non-blank password.
Use this user going forward. For more info on WSL please refer to the [documentation](https://docs.microsoft.com/en-us/windows/wsl/about).
2. If you have licensed software, contact your manager to be registered for a license.
