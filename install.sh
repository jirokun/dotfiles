install() {
  ln -is $1 $2
}

DIR=$(cd $(dirname $0);pwd)

mkdir -p ~/.vim/bundle
if ! [ -d ~/.vim/bundle/neobundle.vim ]; then
  git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
fi

install $DIR/.vimrc $HOME/.vimrc
install $DIR/.gitconfig $HOME/.gitconfig
install $DIR/.tmux.conf $HOME/.tmux.conf

