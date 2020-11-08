#! /bin/bash



range=$1

host_sweep() {
echo -e "\nNow running IPSweep: $(date)\n";
echo -e "Thank you for using IPSweep: $(date)\n" | tee $HOME/host_up.txt >/dev/null;
for ip in {1..254}; do
ping -c 1 $range.$ip | awk -F " " '/64\ bytes/ {printf("%s\n", $4)}' 2>/dev/null | tr -d ":" | tee -a $HOME/host_up.txt >/dev/null &
done
}

#ssh_scan()
#for addr in $HOME/host_up.txt; do
#su -l;
#nmap -sS $addr -p 22 &
#done
#####################################


if [[ "$range" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    host_sweep;
    sleep 3s;
    echo -e "Done!\n";
    cat $HOME/host_up.txt;
    
else
    echo -e "Thank you for using IPSweep";
    
    while [[ ! "$range" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; do
        
	echo -e "...\n\nERROR: syntax\n(e.g.): ipsweep.sh xxx.xxx.xxx";
        read -p "You must enter a valid IP Range to continue: " range;
    
        if [[ "$range" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
	    host_sweep;
	    sleep 3s;
            echo -e "Done!\n";
	    cat $HOME/host_up.txt;
	    break
    	fi
    done
fi
