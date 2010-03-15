#
GIT?=		git

#
all: pull

pull:
	${GIT} pull -v --rebase origin master

push:
	${GIT} push origin master
