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

## Setup automated build + publishing

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
      - LINT_IGNORE=''
      services:
        - docker

    - env:
      - SUBFOLDER=testrepo
      - REPO=cucloudcollab/testrepo
      - TAG=$TRAVIS_COMMIT
      - LINT_IGNORE=''
      services:
        - docker
```

## Build Process

This project is configured to use the Travis CI build matrix functionality (https://docs.travis-ci.com/user/customizing-the-build#Build-Matrix).  This ensures that all subfolders/images are built each day and retain independent success/failure status.  Image builds run in parallel, and successfully built images will be published even if others in the project fail on a given day.

## Tagging + Downstream Images

We recommend using the git hash as a tag for your image builds ($TRAVIS_COMMIT, as shown above).  While a commit is current, each daily build will overwrite the prior with the latest upstream patches.  Additionally, the current build will automatically be tagged as "latest".

## Dockerfile Best Practices

We recommend using hadolint to have dockerfiles conform to community best practices.  This linter is parsing the Dockerfile into an AST and performs rules on top of the AST.
It is standing on the shoulders of Shellcheck to lint the Bash code inside RUN instructions.  We are using hadolint over
other linters (specifically dockerlinter) because it offers a bit more features.  It is a bit more challenging to install, but if you are running
a mac you can simply use brew .. and, of course, you can always use Docker.

Rules can be found here:
https://github.com/lukasmartinelli/hadolint

Install:
```
$ brew install hadolint
or
git clone https://github.com/lukasmartinelli/hadolint
cd hadolint
stack build
```

usage (from hadolint):
```
hadolint <Dockerfile>
hadolint --ignore DL3003 --ignore DL3006 <Dockerfile> # exclude specific rules
```

from docker:
```
docker run --rm -i lukasmartinelli/hadolint < Dockerfile
```

## Contributing

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
