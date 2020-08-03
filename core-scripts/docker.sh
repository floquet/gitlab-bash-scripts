#! /bin/bash
printf '%s\n' "$(date), $(tput bold)${BASH_SOURCE[0]}$(tput sgr0)"

alias drunitv="docker run -it -v ~/Dropbox:/Dropbox "
alias dtlaloc="docker run -it -v /Volumes/Tlaloc:/Tlaloc fedora:orphan"
alias deluxe='echo "docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox fedora:orphan"; docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox fedora:orphan'

alias dcentos='echo "docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox centos:7"; docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox centos:7'

alias dcern6='echo "docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox cern/slc6-base:latest"; docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox cern/slc6-base:latest'

alias dcern7='echo "docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox cern/cc7-base:latest"; docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox cern/cc7-base:latest'

alias ddebian='echo "docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox debian:latest"; docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox debian:latest'

alias dfedora='echo "docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox fedora:orphan"; docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox fedora:orphan'

alias dubuntu='echo "docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox ubuntu:novus-ordo"; docker run -it -v /Volumes/Tlaloc:/Tlaloc -v ~/Dropbox:/Dropbox ubuntu:novus-ordo'

# Chaac
alias ccentos='echo "docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli centos:latest"; docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli centos:latest'
alias cdebian='echo "docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli debian:latest"; docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli centos:latest'
alias cfedora='echo "docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli fedora:32";     docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli fedora:32'
alias cubuntu='echo "docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli ubuntu:groovy"; docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli ubuntu:groovy'
alias cphoton='echo "docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli photon:latest"; docker run -it -v /Volumes/Chaac:/Chaac -v /Volumes/Opochtli:/Opochtli photon:latest'
