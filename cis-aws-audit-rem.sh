
sudo yum update -y

#2.2.2 Ensure X Window System is not installed
sudo yum remove xorg-x11* -y 

#3.3.3 Ensure IPv6 is disabled
sudo sed -i '$ a options ipv6 disable=1' /etc/modprobe.d/CIS.conf

#4.1.4 Ensure events that modify date and time information are collected
sudo sed -i '$ a -a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b64 -S clock_settime -k time-change' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b32 -S clock_settime -k time-change' /etc/audit/audit.rules
sudo sed -i '$ a -w /etc/localtime -p wa -k time-change' /etc/audit/audit.rules

#4.1.5 Ensure events that modify user/group information are collected
sudo sed -i '$ a -w /etc/group -p wa -k identity' /etc/audit/audit.rules 
sudo sed -i '$ a -w /etc/passwd -p wa -k identity' /etc/audit/audit.rules 
sudo sed -i '$ a -w /etc/gshadow -p wa -k identity' /etc/audit/audit.rules 
sudo sed -i '$ a -w /etc/shadow -p wa -k identity' /etc/audit/audit.rules 
sudo sed -i '$ a -w /etc/security/opasswd -p wa -k identity' /etc/audit/audit.rules

#4.1.6 Ensure events that modify the system's network environment are collected
sudo sed -i '$ a -a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale' /etc/audit/audit.rules 
sudo sed -i '$ a -a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale' /etc/audit/audit.rules 
sudo sed -i '$ a -w /etc/issue -p wa -k system-locale' /etc/audit/audit.rules 
sudo sed -i '$ a -w /etc/issue.net -p wa -k system-locale' /etc/audit/audit.rules 
sudo sed -i '$ a -w /etc/hosts -p wa -k system-locale' /etc/audit/audit.rules 
sudo sed -i '$ a -w /etc/sysconfig/network -p wa -k system-locale' /etc/audit/audit.rules

#4.1.7 Ensure events that modify the system's Mandatory Access Controls are collected
sudo sed -i '$ a -w /etc/selinux/ -p wa -k MAC-policy' /etc/audit/audit.rules

#4.1.8 Ensure login and logout events are collected
sudo sed -i '$ a -w /var/run/faillock/ -p wa -k logins' /etc/audit/audit.rules
sudo sed -i '$ a -w /var/log/lastlog -p wa -k logins' /etc/audit/audit.rules

#4.1.9 Ensure session initiation information is collected
sudo sed -i '$ a -w /var/run/utmp -p wa -k session' /etc/audit/audit.rules
sudo sed -i '$ a -w /var/log/wtmp -p wa -k logins' /etc/audit/audit.rules
sudo sed -i '$ a -w /var/log/btmp -p wa -k logins' /etc/audit/audit.rules

#4.1.10 Ensure discretionary access control permission modification events are collected
sudo sed -i '$ a -a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod' /etc/audit/audit.rules

#4.1.11 Ensure unsuccessful unauthorized file access attempts are collected
sudo sed -i '$ a -a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access' /etc/audit/audit.rules

#4.1.13 Ensure successful file system mounts are collected
sudo sed -i '$ a -a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts' /etc/audit/audit.rules

#4.1.14 Ensure file deletion events by users are collected
sudo sed -i '$ a -a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete' /etc/audit/audit.rules

#4.1.15 Ensure changes to system administration scope (sudoers) is collected
sudo sed -i '$ a -w /etc/sudoers -p wa -k scope ' /etc/audit/audit.rules
sudo sed -i '$ a -w /etc/sudoers.d -p wa -k scope' /etc/audit/audit.rules
sudo sed -i '$ a -w /etc/sudoers -p wa -k scope-w /etc/sudoers.d/ -p wa -k scope' /etc/audit/audit.rules

#4.1.17 Ensure kernel module loading and unloading is collected 
sudo sed -i '$ a -w /sbin/insmod -p x -k modules' /etc/audit/audit.rules 
sudo sed -i '$ a -w /sbin/rmmod -p x -k modules' /etc/audit/audit.rules 
sudo sed -i '$ a -w /sbin/modprobe -p x -k modules' /etc/audit/audit.rules 
sudo sed -i '$ a -a always,exit arch=b64 -S init_module -S delete_module -k modules' /etc/audit/audit.rules

#4.2.4 Ensure permissions on all logfiles are configured
sudo find /var/log -type f -exec chmod g-wx,o-rwx {} +


sudo sed -i '$ a -w /var/log/sudo.log -p wa -k actions' /etc/audit/audit.rules
sudo sed -i '$ a -e 2' /etc/audit/audit.rules
sudo sed -i '$ a -w /sbin/insmod -p x -k modules' /etc/audit/audit.rules
sudo sed -i '$ a -w /sbin/rmmod -p x -k modules' /etc/audit/audit.rules
sudo sed -i '$ a -w /sbin/modprobe -p x -k modules' /etc/audit/audit.rules
sudo sed -i '$ a -a always,exit arch=b64 -S init_module -S delete_module -k modules' /etc/audit/audit.rules

#5.2.1Ensure permissions on /etc/ssh/sshd_config are configured
sudo chown root:root /etc/ssh/sshd_config
sudo chmod 600 /etc/ssh/sshd_config

#6.1.6 Ensure permissions on /etc/passwd- are configured
sudo chown root:root /etc/passwd-
sudo chmod 600 /etc/passwd-


