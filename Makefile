#
GIT?=		git

#
all: pull

pull:
	${GIT} pull -v origin master

push: pull
	${GIT} push origin master
