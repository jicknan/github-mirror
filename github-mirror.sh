#!/bin/bash
# github local mirror for CentOS 7
# update 2016-12-09 by jicknan

REPO_DIR="/var/lib/git"
SRC_URL="https://github.com"

repo_org="
  kubernetes
  geerlingguy
  jicknan
  containous
  docker
"
repo_kubernetes="
  contrib
  kubernetes
  community
  features
  kops
  minikube
  dashboard
  release
  kubeadm
  git-sync
"
repo_docker="
  docker
"
repo_geerlingguy="
  ansible-role-dotfiles
  dotfiles
  ansible-role-mas
  mac-dev-playbook
  ansible-role-git
"
repo_jicknan="
  dotfiles
"
repo_containous="
  traefik
"

for org in $repo_org
do
  eval repos=\$repo_$org
  for repo in $repos
  do
    if [ -d $REPO_DIR/$org/${repo}.git ]; then
      echo "==== Updating $SRC_URL/$org/${repo}.git ===="
      (cd $REPO_DIR/$org/${repo}.git; \
      git remote update)
    else
      echo "++++ Mirroring $SRC_URL/$org/${repo}.git ++++"
      (mkdir -p $REPO_DIR/$org/; cd $REPO_DIR/$org/; \
        git clone --mirror ${SRC_URL}/${org}/${repo}.git)
    fi
  done
done
