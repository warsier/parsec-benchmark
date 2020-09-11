set -x
# blackscholes bodytrack ferret fluidanimate freqmine raytrace swaptions vips x264 canneal dedup streamcluster
for bm in blackscholes bodytrack ferret fluidanimate freqmine raytrace swaptions vips x264 canneal dedup streamcluster
do
    # ./bin/parsecmgmt -a run -p ${bm} -n 32 -i simlarge -s "/home/warsier/Documents/sniper_pim_prof/sniper/run-sniper -n 32 -c pimprof_pim -d /home/warsier/Documents/PIMProfdata/parsec-sniper/${bm}_pim --" > /home/warsier/Documents/PIMProfdata/parsec-sniper/${bm}_pim.log 2>&1 &
    ./bin/parsecmgmt -a run -p ${bm} -n 1 -i simlarge -s "/home/warsier/Documents/sniper_pim_prof/sniper/run-sniper -n 1 -c pimprof_cpu -d /home/warsier/Documents/PIMProfdata/parsec-sniper/${bm}_cpu --" > /home/warsier/Documents/PIMProfdata/parsec-sniper/${bm}_cpu.log 2>&1 &
# the submit (-s) of parsec needs to be feeded as a parameter
done
