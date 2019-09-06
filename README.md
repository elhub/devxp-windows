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

* A clean Windows 10 PC or one installed using this script
* Local Administrator rights on the PC
* Edge (to use with Chrome or Firefox, you eed a click-once plugin)

### Installing

To run a recipe, simply click the corresponding link in the table below on your target machine. This will download
the Boxstarter application, and prompt you to run with Administrator privileges. You can then leave the machine to
work for a while and come back when it's finished.

To run a recipe script, click a link in the table below from your target machine (needs to be Edge, Explorer, or a browser with one-click run). This will download the Boxstarter one-click application, and prompt you for Boxstarter to run with Administrator privileges (which it needs to do its job). Clicking yes in this dialog will cause the recipe to begin. You can then (in theory) leave the job unattended and come back when it's finished. Currently, Boxstarter doesn't handle separate local admin accounts in the latest versions of Windows 10, so for now you'll need to login as local admin while the process runs.

|Click link to run  |Description  |
|---------|---------|
|<a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/elhub/windows-dev-box/master/Install-DevBox.ps1'>Elhub DevBox</a>     | Java Development Environment for Windows (JDK, IntelliJ IDEA, etc) |

If you are running a PC without a local administrator account with own login, it would be better to download the powershell scripts and run Install-DevPC.ps1

**Further Steps**

1. The file setup installs WSL with Ubuntu, but the default installation only sets up a root user with a blank
password. You must manually create a non-root user via `$ sudo adduser [USERNAME] sudo` with a non-blank password.
Use this user going forward. For more info on WSL please refer to the [documentation](https://docs.microsoft.com/en-us/windows/wsl/about).
2. Set up VPN connections as described in your welcome e-mail.
3. If you have installed licensed software, contact your manager to have your user license  egistered.

### Known Issues

* Boxstarter's autologin doesn't work properly with multiple user accounts (see https://github.com/chocolatey/boxstarter/issues/318).
As a  result, the user currently needs to login manually as local admin with 
password when the PC is restarted during the install process.
* Has not been tested on Statnett PC yet.

### Todos

* Some packages should perhaps not be upgraded through Chocolatey; e.g., IntelliJ has some issues, etc. Anything that will auto-update can be updated in its own application and should be taken off chocolatey upgrades.
