#
GIT?=		git

#
all: pull

install:
	./install.sh

pull:
	${GIT} pull -v origin master

push: pull
	${GIT} push origin master
