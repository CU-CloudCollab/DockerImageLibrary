# Cornell Hadolint Docker
This image uses Lukas Martinelli github library called hadolint, which is a Docker
linter project.  The project is written in haskell, this image pulls directly from the github
repo (master branch) and builds the environment to run the linter.  It also allows you to specify
which rules to ignore.   This image differs from Lukas' DockerHub image in two ways:

* Built directly from github daily (avoids the staleness issues of the Dockerhub version)
* Is built to allow ignoring of rules (and avoids piping Dockerfile; the downside is you have to mount your Dockerfile)

 references:
 https://github.com/lukasmartinelli/hadolint

## Usage

```
docker run --rm -i -v $(pwd)/$SUBFOLDER/Dockerfile:/opt/hadolint/Dockerfile cucloudcollab/hadolint hadolint $LINT_IGNORE Dockerfile
```
