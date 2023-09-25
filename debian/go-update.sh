#!/usr/bin/bash

function GO_UPD(){
  local GO_VER_RAW=$(curl -sk "https://go.dev/VERSION?m=text")
  local GO_VER=$(echo "$GO_VER_RAW" | awk 'NR==1')
  echo -e " + Installation de la version GO : ${GO_VER} linux amd64"
  wget -q "https://golang.org/dl/${GO_VER}.linux-amd64.tar.gz"
  sudo tar xf "${GO_VER}".linux-amd64.tar.gz -C /usr/local
  [ -f "$HOME/.bashrc" ]&& echo -e "Info: .bashrc existe!\n" || echo -e "Erreur: .bashrc n'existe pas! Création... $(> $HOME/.bashrc)\n"
  echo -e '\nexport GOROOT=/usr/local/go\nexport GOPATH=$HOME/go\nexport PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> $HOME/.bashrc
  source "$HOME"/.bashrc
}
GO_UPD
