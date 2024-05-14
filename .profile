# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function killezr(){
	kill -9 $(cat /home/dawood/7vals/ezrentout/tmp/pids/server.pid)
	rm /home/dawood/7vals/ezrentout/tmp/pids/server.pid
}

function startezr(){
	rails s -p 3001
}

function killezo(){
	kill -9 $(cat /home/dawood/7vals/ezofficeinventory/tmp/pids/server.pid)
	rm /home/dawood/7vals/ezofficeinventory/tmp/pids/server.pid
}

function startezo(){
	rails s -p 3000
}

function killas(){
	kill -9 $(cat /home/dawood/7vals/assetsonar/tmp/pids/server.pid)
	rm /home/dawood/7vals/assetsonar/tmp/pids/server.pid
}

function startas(){
	rails s -p 3002
}

function killandstartezr(){
	$(killezr)
	$(startezr)
}

function killandstartezo(){
	$(killezo)
	$(startezo)
}

function killandstartas(){
	$(killas)
	$(startas)
}

function rc(){
	rails c
}

function rjclear(){
	rails jobs:clear
}

function rjwork(){
	rails jobs:work
}

function rmgt(){
	rails db:migrate
}

function buin(){
	bundle install
}

function gpull(){
	git pull
}

function gpush(){
	git push
}

function gbg(){
    git branch | grep "$1"
}

function srm_crt(){
	CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git push
	git stash -u
	git checkout feature/staging_branch_p11
	git pull
	git pull origin $CURRENT_BRANCH
	git push
	git checkout $CURRENT_BRANCH
	git stash pop
}

function pctcas(){
	CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git push
	git stash -u
	git checkout feature/26178_combined_branch_for_unconsume
	git pull origin $CURRENT_BRANCH
	git push
	git checkout feature/staging_branch_p11
	git pull
	git pull origin feature/26178_combined_branch_for_unconsume
	git push
	git checkout feature/26178_combined_branch_for_unconsume
	git stash pop
}

function co_mbr(){
	git checkout feature/rails_upgrade_final_prod
}

function co_stbr(){
	git checkout feature/staging_branch_p11
}

function crt_br(){
	git rev-parse --abbrev-ref HEAD
}

export EDITOR='subl -w'

function update_vscode(){
	wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O /tmp/code_latest_amd64.deb
	sudo dpkg -i /tmp/code_latest_amd64.deb
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*