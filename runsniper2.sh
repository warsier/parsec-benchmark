set -x

SNIPERDIR=/home/warsier/Documents/sniper_PIMProf
TOPDIRNAME=/home/warsier/Documents/PIMProfdata/parsec-sniper
TOPDIRCOUNT=$(find "${TOPDIRNAME}" -mindepth "1" -maxdepth "1" -type "d" | wc -l)
TARGETDIR=${TOPDIRNAME}/${TOPDIRCOUNT}
CFGTYPE=pimprof_pim
CORECOUNT=1
CORETYPE=cpu
DATASET=simlarge
# blackscholes bodytrack ferret fluidanimate freqmine raytrace swaptions vips x264 canneal dedup streamcluster
BENCHMARKS="blackscholes bodytrack fluidanimate freqmine swaptions"

mkdir ${TARGETDIR}
for bm in ${BENCHMARKS}
do
    ./bin/parsecmgmt -a run -c ${CFGTYPE} -p ${bm} -n ${CORECOUNT} -i ${DATASET} -s "${SNIPERDIR}/run-sniper -n ${CORECOUNT} -c pimprof_${CORETYPE} -d ${TARGETDIR}/${bm}_${CORETYPE}_${CORECOUNT} --" > ${TARGETDIR}/${bm}_${CORETYPE}_${CORECOUNT}.log 2>&1 &
    echo "./bin/parsecmgmt -a run -c ${CFGTYPE} -p ${bm} -n ${CORECOUNT} -i ${DATASET} -s ${SNIPERDIR}/run-sniper -n ${CORECOUNT} -c pimprof_${CORETYPE} -d ${TARGETDIR}/${bm}_${CORETYPE}_${CORECOUNT} -- > ${TARGETDIR}/${bm}_${CORETYPE}_${CORECOUNT}.log 2>&1 &" >> ${TARGETDIR}/command.log
# the submit (-s) of parsec needs to be feeded as a parameter
done
