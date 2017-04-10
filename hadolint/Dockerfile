FROM haskell:7.10
LABEL maintainer "Scott Ross <sr523@cornell.edu>"

## Setup of haskell environmnet and tooling
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "575159689BEFB442" \
 && echo 'deb http://download.fpcomplete.com/debian jessie main' >> /etc/apt/sources.list.d/fpco.list \
 && apt-get update \
 && apt-get install --no-install-recommends -y \
    git=1:2.1.4-2.1+deb8u2 \
    hlint=1.8.61-1+b2 \
    stack \
 && rm -rf /var/lib/apt/lists/*

## Clone from Github https://github.com/lukasmartinelli/hadolint.git
RUN git clone https://github.com/lukasmartinelli/hadolint.git /opt/hadolint/

WORKDIR /opt/hadolint/
RUN stack setup  \
    && stack install # --ghc-options='-optl-static -optl-pthread' --force-dirty

ENV PATH="/opt/hadolint/.stack-work/install/x86_64-linux/lts-4.1/7.10.3/bin:$PATH"
