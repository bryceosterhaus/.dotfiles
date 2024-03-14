#!/bin/bash


# Fonts
FONTS_ARRAY=(
	"https://github.com/source-foundry/Hack/raw/master/build/ttf/Hack-Bold.ttf"
	"https://github.com/source-foundry/Hack/raw/master/build/ttf/Hack-BoldItalic.ttf"
	"https://github.com/source-foundry/Hack/raw/master/build/ttf/Hack-Italic.ttf"
	"https://github.com/source-foundry/Hack/raw/master/build/ttf/Hack-Regular.ttf"
)

for FONT in "${FONTS_ARRAY[@]}"; do
	wget -P /Library/Fonts "${FONT}"
done

# Rebase editor
npm i -g rebase-editor
git config --global sequence.editor rebase-editor