#./bin/parsecmgmt -a run -c pimprof_inj -p blackscholes -n 1 -i simsmall -s "/home/warsier/Documents/sniper_PIMProf/run-sniper --gdb -n 1 -c pimprof_cpu -d blackscholes_cpu_1 --"
./bin/parsecmgmt -a run -c pimprof_inj -p blackscholes -n 1 -i simlarge -s "/home/warsier/Documents/sniper_PIMProf/run-sniper --gdb -n 32 -c pimprof_pim -d blackscholes_pim_32 --"
