MYHOME=/home/dw

#handle dotfiles
rm $MYHOME/.bashrc
ln .bashrc $MYHOME/.bashrc

rm $MYHOME/.vimrc
ln .vimrc $MYHOME/.vimrc

rm $MYHOME/.config/starship.toml
ln starship.toml $MYHOME/.config/starship.toml

rm $MYHOME/.alacritty.yml
ln .alacritty.yml $MYHOME/.alacritty.yml 

rm $MYHOME/.config/i3/config
ln i3config $MYHOME/.config/i3/config 

