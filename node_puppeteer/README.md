# Node + Puppeteer

Puppeteer is a NodeJS API grafted onto Chrome Headless.  It's perfect for doing client
testing - low overhead, small size, and based on the latest Chromium release so it works
pretty much like Chrome.

## Usage
Within Dockerfile:

```
FROM cucloudcollab/node-puppeteer
```

Hints for running this container are in https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md#running-puppeteer-in-docker
In particular, we have found the `--cap-add=SYS_ADMIN` options needs to be specified on the
Docker run command line.  Otherwise you get sandbox errors.