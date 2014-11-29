#
GIT?=		git

#
all: pull

install:
	./install.sh

pull:
	${GIT} pull -v origin master --recurse-submodules=yes

push: pull
	${GIT} push origin master
