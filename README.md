## LXC containers on POCO X3 Pro

### About LXC
Linux Containers (LXC) is an operating-system-level virtualization method for running multiple isolated Linux systems (containers) on a control host using a single Linux kernel (Wikipedia). We can launch much Linux systems on Android without chroot or proot using LXC. This repo contains instructions how to install and use LXC containers on POCO X3 Pro.

### Current status
We can`t use LXC newer than 3.1.0, 3.1.0 currently available in Termux repo.
- [x] Create and booting containers
- [x] Internet
- [x] Hardware acceleration
- [ ] snapd
- [ ] Termux-x11

Notes: We can create users but need to fix sudo and set HOME everytime. lxc-attach working correctly only with --clear-env otherwise you won't be able to run any programs.

### Installation instructions
- [English](docs/Installation(en).md)

### Credits
- [ppoffice](https://gist.github.com/ppoffice) for a list of required cgroup subsystems to be mounted, for a way to create containers without checking rootfs, for the way to use Termux programs in adb shell in the his [guide](https://gist.github.com/ppoffice/154acbc7fa6f8b73b7b3b57af3ca6951)
