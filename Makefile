include config

all:
	time podman build --tag $(TAGNAME) -f ./Dockerfile

remove: rm

rm:
	podman rm $(NAME)

list: ls

ls:
	podman ps -a

.PHONY: all remove rm list ls
