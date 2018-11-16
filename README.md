# python-lambda-packager

This is how your file structure should look like.

```
└── src
    └── <lambda_name>
        ├── lambda_function.py
        ├── readme.md
        └── requirements.txt
└── build
    └── <lambda_name>.zip
```

This command loops through all the folders in src, creates a zip file, and write it to de mounted build folder. The default version of Python is 3.6.

```
docker run -v $(pwd)/src:/src \
    -v $(pwd)/build:/build \
    binxio/python-lambda-packager
```

We also have a 2.7 builder, and even a 3.7 in case Lamda supports this.

```
docker run -v $(pwd)/src:/src \
    -v $(pwd)/build:/build \
    binxio/python-lambda-packager:2.7

docker run -v $(pwd)/src:/src \
    -v $(pwd)/build:/build \
    binxio/python-lambda-packager:3.6

docker run -v $(pwd)/src:/src \
    -v $(pwd)/build:/build \
    binxio/python-lambda-packager:3.7
```

This image is uploaded to docker hub:

https://hub.docker.com/r/binxio/python-lambda-packager/