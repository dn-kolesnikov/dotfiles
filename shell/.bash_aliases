alias la="ls -lah"
alias grep=rg
alias fullupgrade="sudo apt update && sudo apt full-upgrade -y"
alias v="$EDITOR"
alias mvi="mpv --config-dir=$HOME/.config/mvi"
alias curl="curl --proto '=https' --tlsv1.2"
alias go-build-arm="CGO_ENABLED=0 GOSO=linux GOARCH=arm GOARM=7 go build -ldflags='-w -s -extldflags \"-static\"' -a"
