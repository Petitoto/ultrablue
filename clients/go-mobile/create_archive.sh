#!/bin/bash -e

go install golang.org/x/mobile/cmd/gobind@latest
go install golang.org/x/mobile/cmd/gomobile@latest

go mod download golang.org/x/mobile
go get golang.org/x/mobile/bind

gomobile bind -target=android -androidapi 21 -v .

TARGET="../Android/ultrablue/app/libs"
mkdir -p $TARGET
echo "Copying gomobile.aar to $TARGET"
cp gomobile.aar "$TARGET"
