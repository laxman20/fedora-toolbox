FROM registry.fedoraproject.org/fedora-toolbox:latest

ARG NAME=toolbox

LABEL name="$NAME" \
      summary="Fedora toolbox container" \
      maintainer="Laxman"

ENV EDITOR=nvim

RUN curl -L https://github.com/sigstore/cosign/releases/download/v2.5.0/cosign-linux-amd64 -o /usr/bin/cosign \
	    && chmod a+rx /usr/bin/cosign

# Install packages
RUN dnf -y upgrade \
  && dnf -y install \
  neovim \
  fzf \
  fd-find \
  ripgrep \
  bat \
  && dnf clean all

COPY ./aliases.sh /etc/profile.d/
