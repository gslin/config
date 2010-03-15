#
GIT?=		git

#
pull:
	${GIT} pull -v --rebase origin master

push:
	${GIT} push origin master
