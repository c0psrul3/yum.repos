

+ Index of /yumrepos/
  [[https://packages.microsoft.com/yumrepos/]]


+ Index of /rhel/6.9/prod/
  [[https://packages.microsoft.com/rhel/6.9/prod/]]




Linux Software Repository for Microsoft Products
------------------------------------------------
[[https://docs.microsoft.com/en-us/windows-server/administration/linux-package-repository-for-microsoft-software]]

### Overview

  + Microsoft builds and supports a variety of software products for Linux systems and makes them available via standard APT and YUM package repositories. This document describes how to configure the repository on your Linux system, so that you can then install/upgrade Microsoft's Linux software using your distribution's standard package management tools.

  + Microsoft’s Linux Software Repository is comprised of multiple sub-repositories:

    - prod – The Production sub-repository is designated for packages intended for use in production. These packages are commercially supported by Microsoft under the terms of the applicable support agreement or program that you have with Microsoft.

    - mssql-server - These repositories contain packages for Microsoft SQL Server on Linux - See also: SQL Server on Linux.
```
sudo rpm -Uvh http://packages.microsoft.com/config/rhel/6/packages-microsoft-prod.rpm
```
```
sudo rpm -Uvh http://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
```

