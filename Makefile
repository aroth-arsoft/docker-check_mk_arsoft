all: image

image:
	docker build -t rothan/check_mk_arsoft:1.4.0p21 -t rothan/check_mk_arsoft:latest .

cleanup:
	-docker rmi rothan/check_mk_arsoft:latest
	-docker rmi rothan/check_mk_arsoft:1.4.0p21

push: image
	docker push rothan/check_mk_arsoft:latest
	docker push rothan/check_mk_arsoft:1.4.0p21
