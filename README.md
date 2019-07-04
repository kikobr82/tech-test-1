# Dockerfile Fix

[![Build status](https://badge.buildkite.com/d43022fc75a0ca26f690841eb35fa064df08a8e802abbb90e2.svg)](https://buildkite.com/personal-70/tech-test-2)

This API provides a single Information:
  - Hello World! 


## Pipeline

A Buildkite pipeline is being used to build, test and publish this container through the scripts stored on the scripts folder of this repository. The pipeline stages are defined on the **pipeline.yaml** file on the **.buildkite** folder of this repository.

### Agent pre requisites
The buildkite agent have the following pre-requisites:
- Docker
- GIT Repository credentias(if used with a private instance of github or with a private repository)
- Docker image repository(ECR/Artifactory/etc) credential token so the image can be successfully published

### Build
The build is created by using the multi-stage **Dockerfile** file stored in the root folder of this repository and it contains two stages. The first stage build the application and run some unit tests.

### Publish
The image is tagged with the proper values and is published on the docker image repository defined in the **publish.sh** script.


## Running this container locally
This application can run local on machines with the following pre-requisites:
- Docker
- GIT Repository Credentials (if used with a private instance of github or with a private repository)

### Steps to run this locally
In order to run this application locally, the container image will need to be created. TO create it, run the following command from this repository root folder:
```
./scripts/build.sh
```
Once the build is completed, you can run the container with the following command:
```
./scripts/localrun.sh
```

After having the container into a run state, you can access the API with a **http://localhost:8000** and should receive the **Hello WOrld** message.

## Running this pipelne on a different CI tool
This pipeline can be easily migrated to different CI tools but adjustments may be required. CI tools with instances agents can be easily used. Since the stages are using bash scripts, those can be easily leveraged to different CI tools and the only change would be the pipeline stage file to be created based on the new tool.
For containerized CI tools, additional changes will be required, since most of the bash scripts will not be able to be used, however the same steps can be easily migrated to tools like TravisCI and Drone.IO.




