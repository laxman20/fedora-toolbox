FROM registry.fedoraproject.org/fedora-toolbox:latest

ARG NAME=toolbox

LABEL name="$NAME" \
      summary="Fedora toolbox container" \
      maintainer="Laxman"

ENV EDITOR=nvim

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
