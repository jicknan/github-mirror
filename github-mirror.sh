#!/bin/bash
# github local mirror for CentOS 7
# update 2017-01-03 by jicknan

REPO_DIR="/var/lib/git"
SRC_URL="https://github.com"

repo_org="
  kubernetes
  geerlingguy
  jicknan
  containous
  docker
  prometheus
  github
  percona
  google
  elastic
  CISOfy
  medcl
"
repo_CISOfy="
  lynis
"

repo_medcl="
  elasticsearch-analysis-ik
"

repo_elastic="
  beats
  examples
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
repo_google="
  cadvisor
"
repo_docker="
  docker
"
repo_prometheus="
  prometheus
  node_exporter
  mysqld_exporter
"
repo_github="
  orchestrator
"
repo_percona="
  pmm
  pmm-server
  qan-api
  qan-app
  grafana-dashboards
  pmm-client
  qan-agent
  kardianos-service
  node_exporter
  mysqld_exporter
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
  marp
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
      git remote update; \
      git prune; \
      git gc;)
    else
      echo "++++ Mirroring $SRC_URL/$org/${repo}.git ++++"
      (mkdir -p $REPO_DIR/$org/; cd $REPO_DIR/$org/; \
        git clone --mirror ${SRC_URL}/${org}/${repo}.git)
    fi
  done
done
