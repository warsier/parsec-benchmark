for bm in blackscholes bodytrack ferret fluidanimate freqmine raytrace swaptions vips x264
do
    export OMP_NUM_THREADS=1 && ./bin/parsecmgmt -a run -p ${bm} -c pimprof -n 1 -i simlarge -s "/home/warsier/Documents/pin-3.11/pin -t /home/warsier/Documents/PIMProf/build/PinInstrument/PinInstrument.so -c /home/warsier/Documents/PIMProf/Configs/defaultconfig.ini -o ${bm}.2.out --" &
# the submit (-s) of parsec needs to be feeded as a parameter
done
