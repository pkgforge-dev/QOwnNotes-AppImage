#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q qownnotes | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/512x512/apps/QOwnNotes.png
export DESKTOP=/usr/share/applications/PBE.QOwnNotes.desktop

quick-sharun /usr/bin/QOwnNotes /usr/share/QOwnNotes

quick-sharun --make-appimage

quick-sharun --test ./dist/*.AppImage
