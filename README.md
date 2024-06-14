> [!WARNING]  
> This project has been archived and is no longer being actively developed by Elhub.

# devxp-windows

[<img src="https://img.shields.io/badge/repo-github-blue" alt="">](https://github.com/elhub/devxp-windows)
[<img src="https://img.shields.io/badge/issues-jira-orange" alt="">](https://jira.elhub.cloud/issues/?jql=project%20%3D%20%22Team%20Dev%22%20AND%20component%20%3D%20devxp-windows%20AND%20status%20!%3D%20Done)
[<img src="https://teamcity.elhub.cloud/app/rest/builds/buildType:(id:DevXp_DevXpWindows_SonarScan)/statusIcon" alt="">](https://teamcity.elhub.cloud/project/DevXp_DevXpWindows?mode=builds#all-projects)
[<img src="https://sonar.elhub.cloud/api/project_badges/measure?project=no.elhub.devxp%3Adevxp-windows&metric=alert_status" alt="">](https://sonar.elhub.cloud/dashboard?id=no.elhub.devxp%3Adevxp-windows)
[<img src="https://sonar.elhub.cloud/api/project_badges/measure?project=no.elhub.devxp%3Adevxp-windows&metric=ncloc" alt="">](https://sonar.elhub.cloud/dashboard?id=no.elhub.devxp%3Adevxp-windows)
[<img src="https://sonar.elhub.cloud/api/project_badges/measure?project=no.elhub.devxp%3Adevxp-windows&metric=bugs" alt="">](https://sonar.elhub.cloud/dashboard?id=no.elhub.devxp%3Adevxp-windows)
[<img src="https://sonar.elhub.cloud/api/project_badges/measure?project=no.elhub.devxp%3Adevxp-windows&metric=vulnerabilities" alt="">](https://sonar.elhub.cloud/dashboard?id=no.elhub.devxp%3Adevxp-windows)

## About

This repository contains scripts used to install and upgrade Windows tools and applications on an Elhub developer PC.

These scripts are inspired by the [Microsoft Windows Dev Box setup scripts](https://github.com/microsoft/windows-dev-box-setup-scripts)
and leverages the popular open source projects Chocolatey [chocolatey.org](http://chocolatey.org).

The scripts are intended to be idempotent; i.e., you should be able to rerun these scripts at any time to repair/update
the settings and applications on your PC.


## Getting started

### Prerequisities

* A clean Windows 10 PC or one installed using this script
* Local Administrator rights on the PC
* Powershell

### Installing

To install, run the Install-DevTools powershell script directly.

1. Download or clone the repository from Github.
2. Start Powershell as a user with administrative rights 
3. If you have not enabled this previously to allow for running unsigned Powershell scripts, change the execution policy: set-executionpolicy unrestricted
4. Run .\Install-DevTools.ps1
5. Restart the machine if required (it should not be necessary, but is always a good idea after so many changes)


## Usage

This project installs and/or upgrades a large number of Windows applications and tools. Notable apps

### Chocolatey GUI

A graphical UI to Chocolatey. Can be used to search for and/or install apps through chocolatey manually. Run as local
administrator.


## Testing

N/A.


## Roadmap

See the issues list for proposed feature and issues.
* [Github issues](https://github.com/elhub/dev-tools-windows/issues)
* [Elhub Jira](https://jira.elhub.cloud/issues/?jql=project%20%3D%20TD%20AND%20component%20%3D%20dev-tools-windows%20AND%20resolution%20%3D%20Unresolved)


## Contributing

Contributing, issues and feature requests are welcome. See the
[Contributing](https://github.com/elhub/dev-tools-windows/blob/main/CONTRIBUTING.md) file.


## Owners

This project is developed by [Elhub](https://elhub.no). For the specific development group responsible for this
code, see the [Codeowners](https://github.com/elhub/dev-tools-windows/blob/main/CODEOWNERS) file.


## License

This project is [MIT](https://github.com/elhub/dev-tools-windows/blob/main/LICENSE.md) licensed.
