#
GIT?=		git

#
all: pull

pull:
	${GIT} pull -v --rebase origin master

push: pull
	${GIT} push origin master
