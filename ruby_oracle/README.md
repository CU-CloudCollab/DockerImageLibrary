# Ruby Oracle Docker Image
Running a Ruby application is very easy with Docker Hub's Ruby images.  Building a container
triggers normal Ruby stuff like `bundle install` to install dependencies.

The problem is connecting to Oracle.  The Oracle Instant Client is a binary not installable by a gem, nor by Apt or
Yum.  It has to be installed before the `bundle install` gets the `oci8` library.

We solve that problem here by providing Docker images that install both in the right order.  You can use it
as a drop-in replacement for the Docker Hub Ruby image.  It also does not require you to actually _use_ the
Oracle client.

## Usage
Within Dockerfile:

```
FROM cucloudcollab/ruby-oracle
```

## Versions
This image pulls from the ruby 2.3 dockerhub file.  It basically adds oracle support
to the image, copying from node_oracle.

Need to include:

```
gem 'ruby-oci8'
```

## Testing


```
git clone https://github.com/CU-CloudCollab/DockerImageLibrary.git
cd ruby_oracle
docker build -t ruby_oracle .
docker run --rm -it ruby_oracle /bin/sh
irb -r oci8
```
