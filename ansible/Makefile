.PHONY:build
build:
	buildah build -t localhost/archlinux-container
.PHONY:test
test:
	ANSIBLE_VERBOSITY=3 molecule test
