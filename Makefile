#
GIT?=		git

#
all: pull

install:
	./install.sh

pull:
	${GIT} pull -v --recurse-submodules=yes origin master
	${GIT} submodule update --init

push: pull
	${GIT} push origin master
