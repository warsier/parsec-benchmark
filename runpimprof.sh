for bm in bodytrack ferret raytrace vips
do
    /home/warsier/Documents/pin-3.11/pin -t /home/warsier/Documents/PIMProf/build/PinInstrument/PinInstrument.so -c /home/warsier/Documents/PIMProf/Configs/defaultconfig.ini -o ${bm}.out -- ./bin/parsecmgmt -a run -p ${bm} -c pimprof -n 1 -i simsmall &
done
