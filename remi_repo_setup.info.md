Remi's Repo
===========
[[http://rpms.remirepo.net/]]

+ usually used to provide up-to-date PHP and web-application server packages


+ It is preferable to use YUM/DNF to download and install RPM available on this site, however il can be useful to download a RPM for a futher use or for another computer.

+ Locations :
  - the repositories (repoview browser).
      [[https://rpms.remirepo.net/]]
  - sources RPM.
      [[https://rpms.remirepo.net/SRPMS/]]
  - the official git repositories for all the packages tools and web sites
      [[https://git.remirepo.net/cgit]]
  - the deprecated git repository, only used for bug reports and requests
      [[https://github.com/remicollet/remirepo]]


Remi's Repository SRPMs
-----------------------
[[https://rpms.remirepo.net/SRPMS/]]



YUM/DNF automatic configuration
-------------------------------

+ The simplest way is to install the remi-release package which provides the repository configuration for YUM/DNF and the GPG key used to sign the RPM.

+ Enterprise Linux 7 (with EPEL) x86_64
```
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
wget https://rpms.remirepo.net/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm
# for RHEL only
subscription-manager repos --enable=rhel-7-server-optional-rpms
```

+ Enterprise Linux 6 (with EPEL) i386 or x86_64
```
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
wget https://rpms.remirepo.net/enterprise/remi-release-6.rpm
rpm -Uvh remi-release-6.rpm epel-release-latest-6.noarch.rpm
# for RHEL only
rhn-channel --add --channel=rhel-$(uname -i)-server-optional-6
```

+ Fedora 26  i386 or x86_64
```
dnf install https://rpms.remirepo.net/fedora/remi-release-26.rpm
```

+ Fedora 25  i386 or x86_64
```
dnf install https://rpms.remirepo.net/fedora/remi-release-25.rpm
```

+ Fedora 24  i386 or x86_64
```
dnf install https://rpms.remirepo.net/fedora/remi-release-24.rpm
```

+ Fedora 23  i386 or x86_64
```
wget https://rpms.remirepo.net/fedora/remi-release-23.rpm
dnf install remi-release-23.rpm
```

YUM/DNF manual configuration
----------------------------
+ You just have to download the repository file configuration and to save it
  in the appropriate direcotry.

+ Fedora :
```
su -
cd /etc/yum.repos.d
wget https://rpms.remirepo.net/fedora/remi.repo
```

+ Enterprise Linux (RHEL, CentOS) :
```
su -
cd /etc/yum.repos.d
wget https://rpms.remirepo.net/enterprise/remi.repo
```

+ This file provides configuration for remi, remi-php55 and remi-test repositories.

+ Notice : the repository is not enabled on install (enabled=0). You need to enable it when you need it, for example :
```
yum --enablerepo=remi install firefox-langpack-fr
```


Compatibility with other repositories
-------------------------------------

  + On Fedora, available RPM mainly use dependencies from  fedora, and updates repositories, sometime from Rpmfusion.
  
  + On RHEL and CentOS dependencies are in main repositories and in EPEL. I really discourage you from using Rpmforge (well known conflicts with EPEL).
  
  + On RHEL-6, the RHEL Server Optional channel must be enabled.
  
  + Exceptions are explained on the blog article of each RPM.


Remi's signature Installation (GPG Key)
---------------------------------------

+ This step is not required if you use a package manager (Yum or dnf).
  
+ The RPM validity check requires my key to be imported on your system before use. Download GPG key and GPG key 2017 and install them with :
```
rpm --import RPM-GPG-KEY-remi
rpm --import RPM-GPG-KEY-remi2017
```

+ YUM/DNF will propose you to automatic install it on first installation of a RPM from my repository.
  
+ You can list the installed key with :
```
rpm -q gpg-pubkey --qf "%{summary} ->%{version}-%{release}\n"
```
+ My key fingerprint is : 00f97f56-467e318a

+ My new key fingerprint (used for Fedora 26 and new  .src.rpm) est : 0364b949-58bd2928



