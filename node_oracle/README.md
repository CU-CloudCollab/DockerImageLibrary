# Node-Oracle

Docker image to be used for a base to nodejs project ready with Oracle instant
client binaries.  All necessary environment variables are set and ready for use.

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
