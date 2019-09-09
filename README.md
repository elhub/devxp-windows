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

#### Boxstarter

To run a boxstarter recipe, simply click the corresponding link in the table below on your target machine. This will download
the Boxstarter application, and prompt you to run with Administrator privileges. You can then leave the machine to
work for a while and come back when it's finished.

To run a recipe script, click a link in the table below from your target machine (needs to be Edge, Explorer, or a browser with one-click run). This will download the Boxstarter one-click application, and prompt you for Boxstarter to run with Administrator privileges (which it needs to do its job). Clicking yes in this dialog will cause the recipe to begin. You can then (in theory) leave the job unattended and come back when it's finished. Currently, Boxstarter doesn't handle separate local admin accounts in the latest versions of Windows 10, so for now you'll need to login as local admin while the process runs.

|Click link to run  |Description  |
|---------|---------|
|<a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/elhub/windows-dev-box/master/Install-Boxstarter.ps1'>Elhub DevBox</a>     | Java Development Environment for Windows (JDK, IntelliJ IDEA, etc) |

#### PowerShell

If you cannot use Boxstarter, run the Install-DevBox powershell script directly.

1. Download or clone the repository from Github.
2. Start Powershell as a user with administrative rights 
3. If you have not enabled this previously to allow for running unsigned Powershell scripts, change the execution policy:
set-executionpolicy remotesigned --force
4. Run .\Install-DevBox.ps1
   1. You can safely ignore all the errors caused by the script trying to delete apps which are not present
   2. Restart the machine if required 
   3. Downloading and install Ubuntu for WSL can take some time.

#### Post-Installation

1. The DevBox script currently does not install Windows-Subsystem-for-Linux and the Ubuntu image (the Install-WSL.ps1 script does this).  The file setup installs WSL with Ubuntu, but the default installation only sets up a root user with a blank
password. You must manually create a non-root user via `$ sudo adduser [USERNAME] sudo` with a non-blank password.
Use this user going forward. For more info on WSL please refer to the [documentation](https://docs.microsoft.com/en-us/windows/wsl/about).
2. Set up VPN connections as described in your welcome e-mail.
3. If you have installed licensed software, contact your manager to have your user license registered.

### Known Issues

* Boxstarter's autologin doesn't work properly with multiple user accounts (see https://github.com/chocolatey/boxstarter/issues/318).
As a  result, the user currently needs to login manually as local admin with 
password when the PC is restarted during the install process.
* Has not been tested on Statnett PC yet.

### Todos

* Some packages should perhaps not be upgraded through Chocolatey; e.g., IntelliJ IDEA has some unintended behavior with Chocolatey, whereby new versions get installed in parallel with the existing version.
