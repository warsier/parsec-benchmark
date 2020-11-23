#! /bin/bash
set -x
RESULT_DIR=./parsec-32
CPU_CORE=1
PIM_CORE=32
SOLVER=~/Documents/PIMProf_solver/build/PIMProfSolver/Solver.exe
DECISION_MPKI=${RESULT_DIR}/decision_mpki
DECISION_REUSE=${RESULT_DIR}/decision_reuse
BENCHMARKS="blackscholes bodytrack ferret fluidanimate freqmine raytrace swaptions vips x264 canneal dedup streamcluster"

mkdir -p ${DECISION_MPKI} ${DECISION_REUSE}
for bm in ${BENCHMARKS}; do
    PARAM="-c ${RESULT_DIR}/${bm}_pimprof_cpu_${CPU_CORE}/pimprofstats.out -p ${RESULT_DIR}/${bm}_pimprof_pim_${PIM_CORE}/pimprofstats.out -r ${RESULT_DIR}/${bm}_pimprof_cpu_${CPU_CORE}/pimprofreusesegments.out"
    ${SOLVER} mpki ${PARAM} -o ${DECISION_MPKI}/${bm}.out
    ${SOLVER} reuse ${PARAM} -o ${DECISION_REUSE}/${bm}.out
done

