sudo sh configure_os.sh
rm -rf data/*.data
cd kernel && make clean && make
sudo rmmod cachezoom_kernel 
sudo insmod cachezoom_kernel.ko
cd ../client
make clean && make
dead=`sudo cat /proc/kallsyms | grep "t lapic_next_deadline" | awk '{print $1}'`
timer=`sudo cat /proc/kallsyms | grep "t local_apic_timer_interrupt" | awk '{print $1}'`
sudo taskset -c 0 ./cachezoom 0 $dead $timer 4815 1
