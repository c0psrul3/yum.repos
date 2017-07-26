

[[https://wiki.centos.org/TipsAndTricks/CentOSUpgradeTool]]



1. Location of the Tool
-----------------------

+ The tool is currently available from the testing repository:

  [[http://dev.centos.org/centos/6/upg/x86_64/Packages/]]

+ DO NOT USE this tool. Warning: use of this tool is currently BROKEN as several
  system-critical packages are of a higher version number in CentOS 6.7 than they
  are in CentOS 7 so those do not get upgraded correctly. This renders yum and
  several other system tools non-functional.

+ This tool is community maintained, and there are newer versions of this tool
  that need to be maintained by community members. Here are the packages
  on git.centos.org:

  - preupdate-assistant-contents
  - preupgrade-assistant
  - redhat-upgrade-tool

+ Also, the CentOS-6 openscap needs to be verified (and possibly modified), the latest SRPM should be at either:

C6 OS Sources

C6 Updates Sources

If you are interested in modifying these Red Hat packages to work with CentOS Linux, please use the CentOS-Devel Mailing List and collaborate with other community members to bring this functionality to CentOS Linux.



1.1. How to Currently Obtain the Tool
-------------------------------------

Create a Repo file in /etc/yum.repos.d/, named something like upgradetool.repo

Add the following lines to the repo file:
```
[upg]
name=CentOS-$releasever - Upgrade Tool
baseurl=http://dev.centos.org/centos/6/upg/x86_64/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
```

+ This command will then get the RPMs installed to run an upgrade:
```
yum install redhat-upgrade-tool preupgrade-assistant-contents
```

+ Once we do some more testing and move this to the Extras repository, then you will only need to do the yum install command and not create a repo file. These instructions will be changed when the release happens and the tool is no longer in testing.



2. Preupgrade Assistant Purpose
-------------------------------

+ Preupgrade assistant performs an assessment of the system from the "upgradeability" point of view. Such analysis includes checking for removed packages, packages replaced by partially incompatible packages, changes in libraries, users and groups and various services. A report of this analysis can help the administrator with the in-place upgrade - by identifying potential troubles and by mitigating some of the incompatibilities. Data gathered by the preupgrade assistant can be used for the "cloning" of the system - a new, clean installation of the system, as close as possible to the old CentOS setup. In addition, it provides some postupgrade scripts which are supposed to finish the migration after the installation of the CentOS-7 system.

+ As the preupgrade assistant doesn't directly modify the assessed system (except storing information/logs), it is safe to use it on any configuration. As the contents are not yet complete, successful preupgrade assistant analysis doesn't necessarily mean that the in-place upgrade via centos-upgrade-tool will succeed.



3. Preupgrade Assistant Usage
-----------------------------

+ At the moment, only a CLI interface and limited functionality is available.

+ Usage is simple. Just follow these steps:

  - Run "preupg -l" command - it lists all available contents for
    preupgrade-assistant (as the system is based on a plugin, there may be
    modules from different sources in the future). If nothing is shown, install
    the preupgrade-assistant-contents package.

  - If you have CentOS6_7 content available, run the command preupg -s CentOS6_7
  - Wait until the analysis finishes (it can take several minutes)
  - Review the report stored as /root/preupgrade/result.html (and possibly files stored at /root/preupgrade). Especially check for inplace upgrade risks (described further in this document)

4. /root/preupgrade File and Directory Structure

This directory contains the data from the last preupgrade assistant run.

Files:

    result.html - File with a final migration assessment report in human readable form (we are sorry for "listing" functionality only)
    result.xml - File with a final migration assessment report in machine readable form
    README - this file
    results.tar.gz - Tar ball with all files in directory /root/preupgrade

Directories:

    cleanconf - directory with all user-modified configuration files, which were checked for their compatibility by the preupgrade-assistant. These files can be safely used on a CentOS-7 system (some of these files may need postupgrade.d scripts execution)
    dirtyconf - directory with all user-modified configuration files, which were not checked for their compatibility by the preupgrade-assistant. These may require admin review after the CentOS-7 installation/upgrade.
    kickstart - directory which contains various files useful for generating a kickstart file for cloning this system. Some of the files in this directory may give administrators the necesarry guidance in what was not handled by the centos-upgrade-tool (and will need some additional actions). See the README file in the kickstart directory for the file descriptions.
    postupgrade.d - contains various scripts which are supposed to be executed AFTER the upgrade to CentOS-7. These scripts should NEVER be used on a CentOS-6 system.
    CentOS6_7 - just "debugging" directory - will be removed later. Ignore, unless you'll see some "Error" plugin exit status.

5. An Explanation of Possible Check Exit Codes

Every single plugin has its own exit code. Administrators need to check at least those with FAIL results before doing the inplace upgrade. Results marked FIXED should be checked after the inplace upgrade - to finish the CentOS-7 migration properly.

The possible exit codes are:

    PASS = everything is fine, no incompatibility/issue detected by this checker
    FAIL = some incompatibility/issue that needs to be reviewed by the admin was detected. FAIL doesn't necessarily mean that the inplace upgrade will fail, but may result in a not 100% functional system
    FIXED = some incompatibility was detected, but the preupgrade-assistant was able to find an automated solution. Some of the fixes may require running postupgrade.d scripts after the upgrade. Fixed configs are available in /root/preupgrade/cleanconf directory. preupgrade-assistant doesn't handle the fixes automatically at the moment!
    INFORMATIONAL = nice to have information for admins (e.g. removed options in some common tools which may cause malfunctions of their scripts)
    NOT_APPLICABLE = package which should be tested but the check is not installed on the system (test therefore doesn't make sense)
    ERROR = shouldn't occur, does usually mean error in the preupgrade-assistant framework. All such errors should be reported to the Red Hat preupgrade-assistant team.

6. In Place Upgrade Risk Explanations

There are several levels of inplace upgrade risks. Any level higher than "slight" means you will get not a 100% functional upgraded system, although the inplace upgrade tool "centos-upgrade-tool" may pass.

The available risk assessment levels are:

    None - Default. It can be used as an indicator for some checks. It is not necessary to enter these values.
    Slight - We assessed this field and have not found any issues. However, there is still some risk that not all variants have been covered.
    Medium - It is likely that the area causes a problem in case of the inplace upgrade. It needs to be checked by the administrator after the inplace upgrade and after the system has been monitored for some time.
    High - The inplace upgrade can't be used safely without the administrator's assistance. This typically involves some known broken scenarios or existing 3rd party packages. After the administrator manually fixes the issue, it may be possible to perform the inplace upgrade, but it is not recommended.
    Extreme - We found an incompatibility which makes the inplace upgrade impossible. It is recommended to install a new system with the help of the preupgrade-assistant remediations.

7. How to Upgrade After Reviewing the Results

Once you are ready to upgrade (you have mitigated all issues you care to mitigate, etc.), you first need to import the CentOS-7 RPM key with this command:

rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7

Then run the following command to upgrade:

centos-upgrade-tool-cli --network 7 --instrepo=http://mirror.centos.org/centos/7/os/x86_64/

Then reboot.

See man centos-upgrade-tool for more information on all options available for the tool.

NOTE: Use of this tool is at your own risk and is not the best method for upgrades. Make sure you have backups before you actually perform an upgrade. If it breaks, you get to keep both halves!

8. Known Issues When Upgrading

    If you have either the Gnome or KDE desktop installed, upgrade is likely not going to work .. at least not completely.

example output:

INPLACERISK: EXTREME: You have GNOME Desktop Environment session as an option in your X11 session manager. GNOME Desktop
Environment as a part of the yum group 'Desktop' underwent serious redesign in its user interface as well as underlying
technologies in CentOS-7.

    Can not upgrade encrypted partitions

example output:

INPLACERISK: EXTREME: Some partitions are crypted. If it is a system partition then in-place upgrade is not possible.

    If you have lots of 3rd Party repository items (i.e. rpmforge, EPEL, Nux! Dextop, etc.) upgrades will likely not work cleanly.

As we get more specific examples of issues, we will update this page.
