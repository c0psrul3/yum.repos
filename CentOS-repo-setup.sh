#
# CentOS  Repo  GPG Keys:
#
# http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-3
# http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-4
# http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-5
# http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-6
# http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7
# http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-Debug-6
# http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-Debug-7
# http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-Security-6
# http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-Testing-6
# http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-Testing-7
# http://mirror.centos.org/centos/RPM-GPG-KEY-beta
# http://mirror.centos.org/centos/RPM-GPG-KEY-centos4
#


# insert "CentOS Base"  Repos file
#
cat <<"CENTOSBASE"  > /etc/yum.repos.d/centos-base.repo
#####################################################################
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the
# remarked out baseurl= line instead.
#
#

[base]
name=CentOS-$releasever - Base
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os
#baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever

#released updates
[updates]
name=CentOS-$releasever - Updates
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates
#baseurl=http://mirror.centos.org/centos/$releasever/updates/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever

#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras
#baseurl=http://mirror.centos.org/centos/$releasever/extras/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus
#baseurl=http://mirror.centos.org/centos/$releasever/centosplus/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever

#contrib - packages by Centos Users
[contrib]
name=CentOS-$releasever - Contrib
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=contrib
#baseurl=http://mirror.centos.org/centos/$releasever/contrib/$basearch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever
CENTOSBASE
#
#<<< /Endfile  CentOS-base.repo


