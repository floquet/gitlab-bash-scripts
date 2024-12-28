#! /usr/bin/env bash
printf "%s\n" "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# test in info.sh
# if command -v sinfo > /dev/null 2>&1; then
#     source ${core}/info-slurm.sh
# fi

export slurm_queries="${locker}}/slurm-queries"
mkdir -p "${slurm_queries}}"
rm -rf ${slurm_queries}/slurm-*.txt

# is slurm runnning?
if command -v sinfo > /dev/null 2>&1; then
    source ${core}/slurm.sh
    # # sinfo
    export my_log="${slurm_queries}/slurm-sinfo.txt"
    write_standard_header "sinfo" "${my_log}"
    sinfo                       >> ${my_log}

    # # sinfo
    export my_log="${slurm_queries}/slurm-sinfo_s.txt"
    write_standard_header "sinfo_s" "${my_log}"
    sinfo_s                       >> ${my_log}

    # # features
    export my_log="${slurm_queries}/slurm-sinfo-active-avail-features.txt"
    write_standard_header "active, available features" "${my_log}"

    echo 'sinfo -o "%30N %75b %75f"'                 >> ${my_log}
    echo ""                                          >> ${my_log}
    sinfo -o "%30N %75b %75f"                        >> ${my_log}

    # # partitions
    export my_log="${slurm_queries}/slurm-partition-list.txt"
    write_standard_header "partitions" "${my_log}"
    echo "scontrol show partitions"  >> ${my_log}
    echo ""                          >> ${my_log}
    scontrol show partitions         >> ${my_log}

    # # quality of service
    export my_log="${configuration}/slurm-queries/slurm-qos-options.txt"
    write_standard_header "quality of service" "${my_log}"
    echo "sacctmgr list qos"                 >> ${my_log}
    sacctmgr list qos                        >> ${my_log}
fi
