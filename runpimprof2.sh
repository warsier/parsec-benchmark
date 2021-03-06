export CONFIGNAME=defaultconfig_32
# blackscholes bodytrack ferret fluidanimate freqmine raytrace swaptions vips x264 canneal dedup streamcluster
for bm in blackscholes
do
    export OMP_NUM_THREADS=1 && ./bin/parsecmgmt -a run -p ${bm} -c pimprof2 -n 1 -i simlarge -s "/home/warsier/Documents/pin-3.11/pin -t /home/warsier/Documents/PIMProf/build/PinInstrument/PinInstrument.so -c /home/warsier/Documents/PIMProf/Configs/${CONFIGNAME}.ini -o /home/warsier/Documents/PIMProfdata/parsec-pimprof/${bm}_${CONFIGNAME}.out --" > /home/warsier/Documents/PIMProfdata/parsec-pimprof/${bm}_${CONFIGNAME}.log 2>&1 &
# the submit (-s) of parsec needs to be feeded as a parameter
done
