## =============================
## Step 2: Add the prerequisites
## =============================

#
# This YUM Repo can be used to upgrade CentOS-6.5 to 7.x
#
#[[http://www.shaunfreeman.name/upgrading-centos-6-5-to-centos-7-2/]]
#
```
[upg]
name=CentOS-$releasever - Upgrade Tool
baseurl=http://dev.centos.org/centos/6/upg/x86_64/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
```

+ Once done save this file. First we are going to install the pre-upgrade tool
  and run it to show us any potential problems, so in your terminal

+ NOTE: 
  - Before doing this we have to install package 'openscap-1.0.8-1.0.1'
 

```
sudo yum install http://dev.centos.org/centos/6/upg/x86_64/Packages/openscap-1.0.8-1.0.1.el6.centos.x86_64.rpm
sudo yum install preupgrade-assistant-contents redhat-upgrade-tool preupgrade-assistant
```


## =============================
## Step 3: Verifying the upgrade
## =============================

+ Once that has installed run the pre-upgrade check to look for any potential
  problems, now you don’t have to do this be it’s better to check than not to.
```
sudo preupg
```

+ Which gives you a warning and confirmation like
> 
> Preupg tool doesn't do the actual upgrade.
> Please ensure you have backed up your system and/or data in the event of a failed upgrade
>  that would require a full re-install of the system from installation media.
> Do you want to continue? y/n
> 

+ So as we have already make a backup we would type ‘y’ to proceed.

+ Next it will run some checks and give us a out like:
> 
> Result table with checks and their results for main contents:
> ---------------------------------------------------------------------------------------------------------------
> |Bacula Backup Software                                                                    |notapplicable     |
> |PostgreSQL upgrade content                                                                |notapplicable     |
> |GNOME Desktop Environment underwent several design modifications in CentOS 7 release      |notapplicable     |
> |KDE Desktop Environment underwent several design modifications in CentOS 7 release        |notapplicable     |
> |several graphic drivers not supported in CentOS 7                                         |notapplicable     |
> |several input drivers not supported in CentOS 7                                           |notapplicable     |
> |Names, Options and Output Format Changes in arptables                                     |notapplicable     |
> |BIND9 running in a chroot environment check.                                              |notapplicable     |
> |BIND9 configuration compatibility check                                                   |notapplicable     |
> |Move dhcpd/dhcprelay arguments from /etc/sysconfig/* to *.service files                   |notapplicable     |
> |DNSMASQ configuration compatibility check                                                 |notapplicable     |
> |Dovecot configuration compatibility check                                                 |notapplicable     |
> |Net-SNMP check                                                                            |notapplicable     |
> |Squid configuration compatibility check                                                   |notapplicable     |
> |Added and extended options for BIND9 configuration                                        |notapplicable     |
> |Added options in DNSMASQ configuration                                                    |notapplicable     |
> |w3m not available in CentOS 7                                                             |notapplicable     |
> |report incompatibilities between CentOS 6 and 7 in qemu-guest-agent package               |notapplicable     |
> |Removed options in quota tools                                                            |notapplicable     |
> |restore custom selinux configuration                                                      |notapplicable     |
> |samba shared directories selinux                                                          |notapplicable     |
> |CUPS Browsing/BrowsePoll configuration                                                    |notapplicable     |
> |FreeRADIUS Upgrade Verification                                                           |notapplicable     |
> |bind-dyndb-ldap                                                                           |notapplicable     |
> |Identity Management Server compatibility check                                            |notapplicable     |
> |IPA Server CA Verification                                                                |notapplicable     |
> |OpenLDAP /etc/sysconfig and data compatibility                                            |notapplicable     |
> |Configuration for quota_nld service                                                       |notapplicable     |
> |Disk quota netlink message daemon moved into quota-nld package                            |notapplicable     |
> |SSSD compatibility check                                                                  |notapplicable     |
> |Clvmd and cmirrord daemon management.                                                     |notapplicable     |
> |Removal of scsi-target-utils                                                              |notapplicable     |
> |Configuration for warnquota tool                                                          |notapplicable     |
> |Disk quota tool warnquota moved into quota-warnquota package                              |notapplicable     |
> |Quorum implementation                                                                     |notapplicable     |
> |fix krb5kdc config file                                                                   |notapplicable     |
> |cgroups configuration compatibility check                                                 |notapplicable     |
> |Ruby 2.0.0                                                                                |notapplicable     |
> |SCL collections                                                                           |notapplicable     |
> |NIS ypbind config files back-up                                                           |notapplicable     |
> |NIS Makefile back-up                                                                      |notapplicable     |
> |NIS server maps check                                                                     |notapplicable     |
> |NIS server MAXUID and MAXGID limits check                                                 |notapplicable     |
> |NIS server config file back-up                                                            |notapplicable     |
> |several kernel networking drivers not available in CentOS 7                               |pass              |
> |several kernel storage drivers not available in CentOS 7                                  |pass              |
> |Reusable Configuration Files                                                              |pass              |
> |NTP configuration                                                                         |pass              |
> |Information on time-sync.target                                                           |pass              |
> |OpenSSH sshd_config migration content                                                     |pass              |
> |Luks encrypted partition                                                                  |pass              |
> |Architecture Support                                                                      |pass              |
> |Debuginfo packages                                                                        |pass              |
> |Cluster and High Availability                                                             |pass              |
> |Read Only FHS directories                                                                 |pass              |
> |In-place Upgrade Requirements for the /usr/ Directory                                     |pass              |
> |CA certificate bundles modified                                                           |pass              |
> |Developer Tool Set packages                                                               |pass              |
> |Hyper-V                                                                                   |pass              |
> |Check for ethernet interface naming                                                       |pass              |
> |User modification in /etc/rc.local and /etc/rc.d/rc.local                                 |pass              |
> |Plugable authentication modules (PAM)                                                     |pass              |
> |Python 2.7.5                                                                              |pass              |
> |System kickstart                                                                          |pass              |
> |Check for usage of dangerous range of UID/GIDs                                            |pass              |
> |Incorrect usage of reserved UID/GIDs                                                      |pass              |
> |MySQL configuration                                                                       |informational     |
> |Migration of the MySQL data stack                                                         |informational     |
> |Compatibility Between iptables and ip6tables                                              |informational     |
> |VCS repositories                                                                          |informational     |
> |Removed options in coreutils binaries                                                     |informational     |
> |Removed options in gawk binaries                                                          |informational     |
> |Removed options in netstat binary                                                         |informational     |
> |GMP library incompatibilities                                                             |informational     |
> |CVS Package Split                                                                         |informational     |
> |httpd configuration compatibility check                                                   |informational     |
> |File Systems, Partitions and Mounts Configuration Review                                  |informational     |
> |Sonamebumped libs                                                                         |informational     |
> |SonameKept Reusable Dynamic Libraries                                                     |informational     |
> |Removed .so libs                                                                          |informational     |
> |Foreign Perl modules                                                                      |informational     |
> |YUM                                                                                       |informational     |
> |Replaced rpms                                                                             |fixed             |
> |package downgrades                                                                        |fixed             |
> |OpenSSH sysconfig migration content                                                       |fixed             |
> |State of LVM2 services.                                                                   |fixed             |
> |device-mapper-multipath configuration compatibility check                                 |fixed             |
> |Configuration Files to Review                                                             |needs_inspection  |
> |File Lists for Manual Migration                                                           |needs_inspection  |
> |Changes related to moving from MySQL to MariaDB                                           |needs_inspection  |
> |Obsoleted rpms                                                                            |needs_inspection  |
> |Binary rebuilds                                                                           |needs_inspection  |
> |Packages not signed by CentOS                                                             |needs_action      |
> |Removed rpms                                                                              |needs_action      |
> |General                                                                                   |needs_action      |
> |Content for enabling and disabling services based on CentOS 6 system                      |needs_action      |
> ---------------------------------------------------------------------------------------------------------------
> Tarball with results is stored here /root/preupgrade-results/preupg_results-160124125957.tar.gz .
> The latest assessment is stored in directory /root/preupgrade .
> Summary information:
> We found some potential in-place upgrade risks.
> Read the file /root/preupgrade/result.html for more details.
> Upload results to UI by command:
> e.g. preupg -u http://127.0.0.1:8099/submit/ -r /root/preupgrade-results/preupg_results-*.tar.gz .
> 


+ Now you can read the file with the potential upgrade risks but I didn’t all seemed to go well but it doesn’t do any harm as you might have custom programs that will cause problems as all mine were installed from the repos I just went on to the next step which is to import the CentOS 7 repo key so in your terminal
```
sudo rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7
```


## =============================
## Step 4: Starting the upgrade
## =============================

+ Then we have to run the upgrade tool, which doesn’t do the upgrade it just downloads the updates needed to do the upgrade, that happens when we reboot the server so in your terminal
```
sudo /usr/bin/redhat-upgrade-tool-cli --force --network 7 --instrepo=http://mirror.centos.org/centos/7/os/x86_64
```

## =============================
## Step 5: Reboot the server
## =============================

+ Once that has finished we are ready to do the upgrade so bit can be a bit hairy because if you are doing this on a remote server then you might not be able to see the boot process unless you have access a online console. The applying of updates will happen while the server is booting and can take 10-15 minutes so if you are doing this blind it can be a bit of a nail bitting moment, but if you have already practiced this like I did in a VM then you should have confidence in it working OK. That said if your machine doesn’t come back online in 30 minutes then you may need to restore from your backup (you did do that backup now didn’t you?). So in your terminal
```
sudo reboot
```

+ After waiting for about 10 minutes try logging in, if you can’t try again in 10 more minutes and if you still can’t in 30 minutes then you may have to restore to your save point and start again.


## =============================
## Step 6: Check for post upgrade problems
## =============================

+ OK if you are still reading this you made it and have successfully logged into your server lets check our version with
```
sudo cat /etc/centos-release
```

+ And you should see:
"""
  CentOS Linux release 7.2.1511 (Core)
"""

+ Run a update
```
sudo yum update
```

+ if you get errors saying  ‘libpcre.so.0 is missing’ then try reinstalling pcre.
```
yum reinstall pcre
```

+ and if that didn’t work then try symlinking the newer pcre file to the old one with
```
ln -s /lib64/libpcre.so.1 /lib64/libpcre.so.0
```

+ Reinstall all Apache, MySQL and PHP. Now I didn’t do this, I took the opportunity to install Nginx and MariaDB and compile my own PHP so I will do this in the next few posts.

+ I have to go now so I hope this has helped someone.

+ If you want to leave a comment please do and I will try my best at answering.

---
+ Watch on youtube: Upgrading CentOS 6.5 to 7.2
[[https://www.youtube.com/watch?v=vRz_Nr88Nls#action=share]]


---
© Shaun Freeman



