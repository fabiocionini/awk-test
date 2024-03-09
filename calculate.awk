BEGIN {
    FS=","
}
NR > 1 {
    operationtype = $1
    starttime = $2
    endtime = $3
    time = endtime - starttime

    if (!(operationtype in maxTime) || maxTime[operationtype] < time)
        maxTime[operationtype] = time
    if (!(operationtype in minTime) || minTime[operationtype] > time)
        minTime[operationtype] = time

    accTime[operationtype] = accTime[operationtype] + time
    lines[operationtype]++
}
END {
    for (op in accTime) {
        meanTime = accTime[op] / lines[op]
        print "----------------------"
        printf "Operation:\t%s\n", op
        printf "Min time:\t%i\n", minTime[op]
        printf "Max time:\t%i\n", maxTime[op]
        printf "Mean time:\t%.2f\n", meanTime
        print "----------------------"
    }
}