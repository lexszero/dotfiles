#!/bin/bash -x
hd="$(git rev-parse --show-toplevel 2>/dev/null)/.git/hooks" || exit 1
rm -f $hd/post-{commit,checkout,merge}
cat > $hd/post-commit <<EOF
#!/bin/bash
sudo cp .zshrc_common /etc/zsh/zshrc_common
sudo cp .vimrc_common /etc/vim/vimrc.local
EOF
chmod +x $hd/post-commit
for h in post-{checkout,merge}; do
	ln -s post-commit $hd/$h
done
