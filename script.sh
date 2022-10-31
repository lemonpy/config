#!/bin/sh
GIT_DIR=$HOME/.cfg
CONFIG_DIR=$HOME/.config
CONFIG_BACKUP=$CONFIG_DIR/config_backup
RC_FILE=.zshrc

git clone --bare https://github.com/lemonpy/config.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$GIT_DIR --work-tree=$CONFIG_DIR $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv -b $CONFIG_DIR/{} $CONFIG_BACKUP/{}
fi;
config checkout
config config status.showUntrackedFiles no
if [ -f $RC_FILE ]; then
	echo "Moving .bashrc/.zshrc file to $CONFIG_BACKUP"
	mv $RC_FILE $CONFIG_BACKUP
fi
ln -s $CONFIG_DIR/$RC_FILE $RC_FILE
