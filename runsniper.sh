set -x

TOPDIRNAME=/home/warsier/Documents/PIMProfdata/parsec-sniper
TOPDIRCOUNT=$(find "${TOPDIRNAME}" -mindepth "1" -maxdepth "1" -type "d" | wc -l)
TARGETDIR=${TOPDIRNAME}/${TOPDIRCOUNT}
CORECOUNT=32
CORETYPE=pim
DATASET=simsmall
# blackscholes bodytrack ferret fluidanimate freqmine raytrace swaptions vips x264 canneal dedup streamcluster
BENCHMARKS="blackscholes bodytrack ferret fluidanimate freqmine raytrace swaptions vips x264 canneal dedup streamcluster"

mkdir ${TARGETDIR}
for bm in ${BENCHMARKS}
do
    ./bin/parsecmgmt -a run -p ${bm} -n ${CORECOUNT} -i ${DATASET} -s "/home/warsier/Documents/sniper_pim_prof/sniper/run-sniper -n ${CORECOUNT} -c pimprof_${CORETYPE} -d ${TARGETDIR}/${bm}_${CORETYPE}_${CORECOUNT} --" > ${TARGETDIR}/${bm}_${CORETYPE}_${CORECOUNT}.log 2>&1 &
    echo "./bin/parsecmgmt -a run -p ${bm} -n ${CORECOUNT} -i ${DATASET} -s /home/warsier/Documents/sniper_pim_prof/sniper/run-sniper -n ${CORECOUNT} -c pimprof_${CORETYPE} -d ${TARGETDIR}/${bm}_${CORETYPE}_${CORECOUNT} -- > ${TARGETDIR}/${bm}_${CORETYPE}_${CORECOUNT}.log 2>&1 &" >> ${TARGETDIR}/command.log
# the submit (-s) of parsec needs to be feeded as a parameter
done
