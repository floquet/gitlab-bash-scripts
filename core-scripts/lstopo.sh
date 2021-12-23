#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

# is lstopo defined?
if type "lstopo" > /dev/null 2>&1; then
    # save time - do not regenrate
    export file_base="${locker}/lstopo"
    export file_lstopo="${file_base}.txt"
    if ! [ -e ${file_lstopo} ]
        then
            lstopo     ${file_lstopo}
            lstopo -v "${file_base}-v.txt"
            lstopo -p "${file_base}-p.txt"
            lstopo    "${file_base}.pdf"
    fi
    lstopo-no-graphics        ${locker}/lstopo.pdf
    if ! [ -f ${locker}/lstopo.txt ]; then
        lstopo-no-graphics   ${locker}/lstopo.txt
    fi
    if ! [ -f ${locker}/lstopo-v.txt ]; then
        lstopo-no-graphics -v ${locker}/lstopo-v.txt
    fi
    lstopo ${locker}/lstopo.pdf > /dev/null 2>&1
    lstopo ${locker}/lstopo.png > /dev/null 2>&1
    lstopo ${locker}/lstopo.xml > /dev/null 2>&1
    #lstopo-no-graphics -vpc -of txt   ${id}/lstopo-vpc.txt
    #lstopo --of pdf           ${id}/lstopo.pdf
fi
