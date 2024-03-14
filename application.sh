#!/bin/bash

APPLICATIONS_ARRAY=(
	"1password"
	"raycast"
	"appcleaner"
	"bettertouchtool"
	"firefox"
	"caffeine"
	"docker"
	"hiddenbar"
	"iterm2"
	"skype"
	"slack"
	"spotify"
	"sublime-merge"
	"visual-studio-code"
	"intellij-idea"
	"obsidian
)

for APPLICATION in "${APPLICATIONS_ARRAY[@]}"; do
	brew cask install "${APPLICATION}"
done