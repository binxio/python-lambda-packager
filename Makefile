
pwd=$(shell pwd)
.PHONY: build test deploy

build:
	docker build -f Dockerfile-2.7 -t binxio/python-lambda-packager:2.7 . ; \
	docker build -f Dockerfile-3.6 -t binxio/python-lambda-packager:3.6 -t binxio/python-lambda-packager . ; \
	docker build -f Dockerfile-3.7 -t binxio/python-lambda-packager:3.7 . ;

test:
	docker run -v $(pwd)/src:/src -v $(pwd)/build:/build binxio/python-lambda-packager ; \
	docker run -v $(pwd)/src:/src -v $(pwd)/build-2.7:/build binxio/python-lambda-packager:2.7 ; \
	docker run -v $(pwd)/src:/src -v $(pwd)/build-3.6:/build binxio/python-lambda-packager:3.6 ; \
	docker run -v $(pwd)/src:/src -v $(pwd)/build-3.7:/build binxio/python-lambda-packager:3.7 ; \
	docker run -v $(pwd)/src:/src -v $(pwd)/build:/build binxio/python-lambda-packager

test-single:
	docker build -f Dockerfile-2.7 -t python-lambda-packager:2.7 . ; \
	docker run -v $(pwd)/build-2.7:/build python-lambda-packager:2.7 ; \

test-local:
	docker build -f Dockerfile-2.7 -t python-lambda-packager:2.7 . ; \
	docker run -v $(pwd)/src:/src -v $(pwd)/build-2.7:/build python-lambda-packager:2.7 ; \
	docker build -f Dockerfile-3.6 -t python-lambda-packager:3.6 . ; \
	docker run -v $(pwd)/src:/src -v $(pwd)/build-3.6:/build python-lambda-packager:3.6 ; \
	docker build -f Dockerfile-3.7 -t python-lambda-packager:3.7 . ; \
	docker run -v $(pwd)/src:/src -v $(pwd)/build-3.7:/build python-lambda-packager:3.7

deploy:
	docker push binxio/python-lambda-packager:3.6 ; \
	docker push binxio/python-lambda-packager:3.7 ; \
	docker push binxio/python-lambda-packager:2.7 ; \
	docker push binxio/python-lambda-packager

