#GRUB_CMDLINE_LINUX_DEFAULT="quiet splash isolcpus=1,2,3 nohz_full=1,2,3 nosmep nosmap"
#sudo update-grub

# Disable logical CPU pairs
echo 0 > /sys/devices/system/cpu/cpu2/online
echo 0 > /sys/devices/system/cpu/cpu3/online

# Set IRQ affinity mask to CPU 0
cd /proc/irq/
echo 1 | tee */smp_affinity

# CPU Frequency
cd /sys/devices/system/cpu/
echo performance | tee cpu*/cpufreq/scaling_governor
echo 2010000 | tee cpu*/cpufreq/scaling_max_freq
echo 2000000 | tee cpu*/cpufreq/scaling_min_freq




