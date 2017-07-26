fedora "EPEL" Repository
========================
[[http://fedoraproject.org/wiki/EPEL]]

RPM Download URLs:
------------------
[[http://fedoraproject.org/wiki/EPEL#How_can_I_use_these_extra_packages.3F]]

+ EPEL for RHEL7
  [[https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm]]

+ EPEL for RHEL6
  [[https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm]]

+ EPEL for RHEL5
  [[https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm]]

+ EPEL GPG Keys
  [[https://fedoraproject.org/keys]]


Import EPEL GPG key in kickstart post-installation
==================================================
[[http://unix.stackexchange.com/questions/81354/ddg#81370]]
# Method #1   - OBSOLETE!  below URL no longer resolves

+ You can do this in the %post section:
```
echo "configuring epel repository"
rpm -Uvh http://download.fedora.redhat.com/pub/epel/beta/6/x86_64/epel-release-6-5.noarch.rpm
```

# Method #2

+ I think the more formal way of doing this is like this though in your .ks file:
```
repo --name=epel --baseurl=http://LOCALEPELMIRROR/.../epel/6/x86_64/
%package
...
epel-release

%post
...
/usr/sbin/rhnreg_ks --activationkey=$ACTIVATIONKEY
rpm --import /usr/share/rhn/RPM-GPG-KEY
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release-2
```

# Method #3     - best, easiest way.  ++ req #4

+ You can also use a heredoc and generate a yum .repo file into the /etc/yum.repos.d/ like so:
```
cat >/etc/yum.repos.d/your.repo <<EOF
[... INCLUDE REPO CONFIG FILE CONTENTS HERE ...]
EOF
```

# Method #4

+ If you have already configured the Repository, by importing a ".repo" file
  to /etc/yum.repos.d/,  EPEL actually provides a package, which imports the
  GPG key:  

```
# yum install --nogpgcheck epel-release
```
  - NOTE:  Pay special attention to the use of "--nogpgcheck", else the
    package will not install due to the missing key, as provided by the 
    package, which itself is not yet installed.


References
==========

- [[http://fedoraproject.org/wiki/Anaconda/Kickstart#repo]]

- [[http://www.centos.org/docs/5/html/Installation_Guide-en-US/s1-kickstart2-options.html]]


