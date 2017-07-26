RPM Fusion
==========
[[https://rpmfusion.org/]]

+ RPM Fusion provides software that the Fedora Project or Red Hat doesn't 
  want to ship. That software is provided as precompiled RPMs for all current
  Fedora versions and current Red Hat Enterprise Linux or clones versions; you
  can use the RPM Fusion repositories with tools like yum and PackageKit.

+ RPM Fusion is a merger of Dribble, Freshrpms, and Livna; our goal is to
  simplify end-user experience by grouping as much add-on software as possible
  in a single location. Also see our FoundingPrinciples.


RPM Fusion for RHEL6:
---------------------
(free)[[https://download1.rpmfusion.org/free/el/rpmfusion-free-release-6.noarch.rpm]]
(nonfree)[[https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-6.noarch.rpm]]

RPM Fusion for RHEL7:
---------------------
(free)[[https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm]]
(nonfree)[[https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm]]

RPM Fusion GPG Keys and Package Integrity Information:
------------------------------------------------------
[[https://rpmfusion.org/keys]]


Command Line Setup using rpm
----------------------------

+ To enable access to both the free and the nonfree repositories use this cmd:

  - Fedora 22 and later:
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

  - RHEL 6 or compatible like CentOS:
```
sudo yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-6.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-6.noarch.rpm
```

  - RHEL 7 or compatible like CentOS:
```
sudo yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm
```

