#!/usr/bin/env sh
set -eu

/setup-ssh.sh

export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
git config --global user.email $EMAIL
git config --global user.name $NAME
git remote add mirror "$INPUT_TARGET_REPO_URL"
git pull --rebase mirror master
git push mirror
