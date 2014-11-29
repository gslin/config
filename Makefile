#
GIT?=		git

#
all: pull

install:
	./install.sh

pull:
	${GIT} pull -v origin master
	${GIT} submodule update --init --recursive

push: pull
	${GIT} push origin master
