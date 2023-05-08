# Fix suid
mount -o remount,dev,suid /data

# Mount cgroup_root
mount -t tmpfs cgroup_root /sys/fs/cgroup

# Create cgroups subsystem folders
mkdir /sys/fs/cgroup/cpu
mkdir /sys/fs/cgroup/cpuacct
mkdir /sys/fs/cgroup/cpuset
mkdir /sys/fs/cgroup/memory
mkdir /sys/fs/cgroup/pids
mkdir /sys/fs/cgroup/devices
mkdir /sys/fs/cgroup/freezer
mkdir /sys/fs/cgroup/blkio
mkdir /sys/fs/cgroup/systemd

# Mount cgroups subsystem folders
mount -t cgroup cgroup -o none,name=systemd /sys/fs/cgroup/systemd
mount -t cgroup cpu -o cpu /sys/fs/cgroup/cpu
mount -t cgroup cpuacct -o cpuacct /sys/fs/cgroup/cpuacct
mount -t cpuset cpuset -o cpuset /sys/fs/cgroup/cpuset
mount -t cgroup memory -o memory /sys/fs/cgroup/memory
mount -t cgroup pids -o pids /sys/fs/cgroup/pids
mount -t cgroup devices -o devices /sys/fs/cgroup/devices
mount -t cgroup freezer -o freezer /sys/fs/cgroup/freezer
mount -t cgroup blkio -o blkio /sys/fs/cgroup/blkio
