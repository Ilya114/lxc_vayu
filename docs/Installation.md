## LXC on POCO X3 Pro installations instructions

### Requirements
- Kernel with this configs: `CONFIG_FHANDLE=y CONFIG_CGROUP_PIDS=y CONFIG_CGROUP_DEVICE=y CONFIG_CPUSETS=y CONFIG_PROC_PID_CPUSET=y CONFIG_PAGE_COUNTER=y CONFIG_MEMCG=y CONFIG_MEMCG_SWAP=y CONFIG_MEMCG_SWAP_ENABLED=y CONFIG_CGROUP_PERF=y CONFIG_BLK_CGROUP=y CONFIG_CGROUP_WRITEBACK=y CONFIG_CHECKPOINT_RESTORE=y CONFIG_USER_NS=y CONFIG_DEVPTS_MULTIPLE_INSTANCES=y CONFIG_PROC_CHILDREN=y`. If you using ArrowOS 13 you can [download](https://drive.google.com/file/d/1WFMJDoNvI8QuDWStipSkvM53BqChLQAJ/view?usp=sharing) already compiled kernel by me.
- Root rights
- [Termux](https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_arm64-v8a.apk)

### Install LXC
Open Termux and update packages: `pkg update`, then install tsu and lxc: `pkg install tsu lxc`

### Mount cgroup
Download [this](files/mountcgroup.sh) script, run `tsu` (give root rights to Termux app), then run `sh mountcgroups.sh`

### Create container
Create LXC container (I using Ubuntu 22.04): `lxc-create ubuntu -t download -- --no-validate`

### Edit config
We need mount `kgsl-3d0` and share internet to host, `/data/data/com.termux/files/usr/var/lib/lxc/ubuntu/config` and add this lines:
```
lxc.mount.entry = /dev/kgsl-3d0 dev/kgsl-3d0 none bind,optional,create=file
lxc.cgroup.devices.allow =
lxc.cgroup.devices.deny =
lxc.net.0.type = none
lxc.net.0.flags = up
lxc.net.0.hwaddr = 00:16:3e:b8:16:74
```
### Run container
Now, we can run container: `lxc-start ubuntu -F` and you should show booting systemd. Then he asks login and password open second Termux session and attach your container: `lxc-attach ubuntu --clear-env`, then run `/usr/bin/passwd` and type new password. Back to first session and type login `root` and your password which your set.

### Fix internet
Make sure what internet working: `ping 8.8.8.8`, you should show pings, but if you try `apt update` repo wont update. Run `vi /etc/resolv.conf` and write `nameserver 8.8.8.8` instead of exist, then quit with write and save file. Go to /etc/systemd/resolved.conf and type `DNS 8.8.8.8`, then quit with write and save file. Now, internet should fully works.

### DE and hardware acceleration.
Now, i recommend use VNC or XSDL because termux-x11 not working. You can compile Turnip+Zink and get hardware acceleration using [this](https://github.com/Ilya114/box86-64-termux/blob/main/docs/INSTALLATION.md#compile-adreno-turnip-and-zink-driver) guide
