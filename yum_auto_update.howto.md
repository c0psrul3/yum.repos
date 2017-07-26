
6. Updating Your System with yum
================================
[[https://www.centos.org/docs/5/html/yum/sn-updating-your-system.html]]

+ Use the update option to upgrade all of your CentOS system software to the latest version with one operation.

+ To perform a full system update, type this command:
```
su -c 'yum update'
```

6.1. Automatically Updating Your System
---------------------------------------

+ The yum package supplied with CentOS includes scripts to perform full system updates every day. To activate automatic daily updates, enter this command:
```
su -c '/sbin/chkconfig --level 345 yum on; /sbin/service yum start'
```

---
+ [Note]	How Daily Updates are Run

  - There is no separate yum service that runs on your system. The command given above enables the control script /etc/rc.d/init.d/yum. This control script activates the script /etc/cron.daily/yum.cron, which causes the cron service to perform the system update automatically at 4am each day.

