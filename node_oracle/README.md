# Node-Oracle

Docker image to be used as a base for nodejs developement.  This uses the oracle base
docker image.  All necessary environment variables are set and ready for use.

## Usage
Within Dockerfile:

```
FROM cucloudcollab/node-oracle
```

## Versions
This image pulls from base ubuntu and builds node as of v7 for linux.
This version of the image includes:
* Build Essentials
* nodejs
* Oracle Instant Client
