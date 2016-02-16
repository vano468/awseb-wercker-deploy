NAME=`whoami`/awseb-wercker-deploy

build:
	docker build -t $(NAME) --rm .

push:
	docker push $(NAME)

pull:
	docker pull $(NAME)

shell:
	docker run -it $(NAME) bash
