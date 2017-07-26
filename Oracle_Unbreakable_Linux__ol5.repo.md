Oracle Unbreakable Linux (ol5) - Public Repository
==================================================

To setup ol5 repo, you need to configure your yum repositories 
--------------------------------------------------------------
+ (note that the destination name is "ol" for "Oracle Linux" 
  rather than "el" for "RH Enterprise Linux"):

```
  # wget http://public-yum.oracle.com/public-yum-el5.repo
  # cp public-yum-el5.repo /etc/yum.repos.d/ol5.repo
```

+ then edit the ol5.repo file and
  - make sure the el5_ga_base is enabled
  - make sure the el5_u5_base is enabled
  - make sure ol5_u6_base is enabled
  - make sure everything else is not enabled

+ then you need to update your system with "yum update" (in our case it was over 248 patches)

