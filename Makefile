#
GIT?=		git

#
pull:
	${GIT} pull -v

push:
	${GIT} push origin master
