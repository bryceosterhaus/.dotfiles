#!/bin/bash

GIT_REPOS_ARRAY=(
	"git@github.com:liferay/clay.git"
	"git@github.com:liferay/liferay-portal.git"
	"git@github.com:liferay/liferay-portal-ee.git"
	"git@github.com:liferay/liferay-frontend-projects.git"
	"git@github.com:liferay/liferay-binaries-cache-2020.git"
)

mkdir ~/repos

cd ~/repos

for GIT_REPO in "${GIT_REPOS_ARRAY[@]}"; do
	git clone "${GIT_REPO}" --origin upstream
done