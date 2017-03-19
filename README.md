# CU-CloudCollab (C4) Docker Image Library

A library of common base image Dockerfiles in use at Cornell.  The Dockerfiles included in this repository are built daily and published to CU-CloudCollab DockerHub repositories at: https://hub.docker.com/r/cucloudcollab/

## Repository Structure

Each Dockerfile and required files should live in a subfolder off the root of this repository (e.g., cwmonitor).  Each subfolder should include a README that explains its purpose and use.

```
.travis.yml

README.MD

cwmonitor/
  Dockerfile
  README.md

testrepo/
  Dockerfile
  OtherDependencies
  README.md
```

## Setup automated built + publishing

This repository is configured for build and publish with Travis CI.  Builds are triggered by pushes on this repository, as well as a daily cron trigger to ensure new images are published at least daily.  The build status and history is available here: https://travis-ci.org/CU-CloudCollab/DockerImageLibrary

To add a new image to be build and published:

1. Add a new subfolder with a Dockerfile for your image

2. Add a new repository to the CUCloudCollab DockerHub organization.  Grant explicit "write" permission to the travisbuild team.

3. Add a new env entry for your subfolder to the matrix block of the .travis.yml file (example below of "testrepo") - then commit.

```
matrix:
  include:
    - env:
      - SUBFOLDER=cwmonitor
      - REPO=cucloudcollab/cwmonitor
      - TAG=$TRAVIS_COMMIT
      services:
        - docker

    - env:
      - SUBFOLDER=testrepo
      - REPO=cucloudcollab/testrepo
      - TAG=$TRAVIS_COMMIT
      services:
        - docker
```

## Build Process

This project is configured to use the Travis CI build matrix functionality (https://docs.travis-ci.com/user/customizing-the-build#Build-Matrix).  This ensures that all subfolders/images are built each day and retain independent success/failure status.  Image builds run in parallel, and successfully built images will be published even if others in the project fail on a given day.

## Tagging + Downstream Images

We reccomend using the git hash as a tag for your image builds ($TRAVIS_COMMIT, as shown above).  Each daily build will overwrite the prior with the latest upstream patches.  Additionally, the current build will automatically be tagged as "latest".

Downstream images can explicitly lock to a git hash which ensures they don't unexpectedly inherit major changes to the image, but that they still receive daily upstream patches.  They can also choose to follow latest if changes aren't a concern.


## Contributing

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
