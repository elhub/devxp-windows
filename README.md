# windows-dev-box

This repository contains scripts used to deploy and upgrade an Elhub Windows developer PC.

These scripts are inspired by the [Microsoft Windows Dev Box setup scripts](https://github.com/microsoft/windows-dev-box-setup-scripts) and 
leverages the popular open source projects Chocolatey [chocolatey.org](http://chocolatey.org)

The scripts are intended to be idempotent; i.e., you should be able to rerun these scripts at any time to repair/update the settings and applications on your
PC. 

## Getting started

### Prerequisities

* A clean Windows 10 PC or one installed using this script
* Local Administrator rights on the PC
* Powershell

### Installing

#### PowerShell

To install, run the Install-DevBox powershell script directly.

1. Download or clone the repository from Github.
2. Start Powershell as a user with administrative rights 
3. If you have not enabled this previously to allow for running unsigned Powershell scripts, change the execution policy:
set-executionpolicy remotesigned
4. Run .\Install-DevBox.ps1
   1. You can safely ignore all the errors caused by the script trying to delete apps which are not present
   2. Restart the machine if required 

#### Post-Installation

1. The DevBox script currently does not install Windows-Subsystem-for-Linux and the Ubuntu image (the Install-WSL.ps1 script does this). Installing 
WSL takes a massive amount of time to download and install, making this easier to do manually. See
https://confluence.elhub.org/display/ELTOR/Getting+Started+on+Eltostratus for details
2. Set up VPN connections as described in your welcome e-mail. This means you need to install the OPENVPN GUI and Cisco AnyConnect manually.
3. If you have installed licensed software, contact your manager to have your user license registered. 

### Known Issues

* Boxstarter's autologin doesn't work properly with multiple user accounts (see https://github.com/chocolatey/boxstarter/issues/318).
As a  result, the user currently needs to login manually as local admin with password when the PC is restarted during the install process.
* Does not work to setup Statnett PC's.

### Todos

* Some packages should perhaps not be upgraded through Chocolatey; e.g., IntelliJ IDEA currently has some unintended behavior with Chocolatey, whereby new 
versions get installed in parallel with the existing version rather than replacing them.
* There is an experimental script for this project that uses BoxStarter (Boxstarter is a wrapper for Chocolatey that handles features like managing reboots and
other issues). Unfortunately, the current development box that we receive from Statnett does not support usage of Boxstarter.
