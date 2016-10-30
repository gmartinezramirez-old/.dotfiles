#
# Description:
#   A post-installation bash script for Ubuntu/Debian
#
# File:
#   deb-post-install.sh
#
# Usage:
#   chmod +x debian-post-install.sh && ./debian-post-install.sh

tabs 4
clear
echo ''
echo '#----------------------------------------#'
echo '#       Debian Post-Install Script       #'
echo '#----------------------------------------#'

enter-su() {
    su
}

update() {
    apt-get update
}

upgrade() {
    apt-get update
}

dist-upgrade() {
    apt-get dist-upgrade
}

upgrade-to-testing() {
    enter-su
    update
    #dist-upgrade()
}

install-dev-tools(){
    for PROG in "tmux"\
            "vim"\
            "neovim"\
            "iceweasel"\
            "mlocate"\
            "orage"\
            "gcalctool"\
            "lm-sensors"

    do
        echo "Installing "$PROG
        sudo apt-get install -y --force-yes $PROG
        sleep 1s
        echo "Done"
        echo ""
}

install-i3wm() {
    sudo sh -c 'echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list.d/i3.list'
    sudo apt-get update
    sudo apt-get --allow-unauthenticated install sur5r-keyring
    sudo apt-get update
    sudo apt-get install i3

}

install-necessary() {
    apt-get install software-properties-common
}

install-neovim() {
    add-apt-repository ppa:neovim-ppa/unstable
    apt-get update
    apt-get install neovim
}

install-python3.4() {
    #Prerequisites
    sudo apt-get install build-essential checkinstall
    sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
    cd /usr/src
    sudo wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz
    sudo tar xzf Python-3.4.3.tgz
    cd Python-3.4.3
    sudo ./configure
    #make altinstall is used to prevent replacing the default python binary file /usr/bin/python.
    sudo make altinstall

}

install-guake() { 
    #Install guake terminal...
    echo "Installing guake terminal"
    echo ""
    sleep 1s
    apt-get install -y guake
    print-done
}

install-firefox() {
    echo "Removing iceweasel browser"
    apt-get remove iceweasel*
    echo "Installing Firefox browser"
    apt-get install firefox
}

install-fish() {
    apt-get install fish
    #Oh-My-Fish
    curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
    #Fish default shell
    chsh -s /usr/bin/fish	
}

install-git() {
    apt-get install git-core

}

install-ruby () {
    apt-get install ruby-full
}

install-tmux() {
    apt-get install tmux
    #Install Tmux Plugin Manager
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

colors-base16 () {
    #Guake
    git clone https://github.com/chriskempson/base16-builder.git

}

install-utils() {
    apt-get install wget
    apt-get install curl
    apt-get install ranger
    apt-get install ctags
    # Install Sublime 3
    sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
    sudo apt-get update
    sudo apt-get install -y sublime-text-installer
    sudo apt-get install rofi
    sudo apt-get install dconf-tools
    sudo apt-get install xbacklight
    # Install Dropbox
    cd ~
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    ~/.dropbox-dist/dropboxd
    # Install RedShift (fork of f.lux)
    sudo apt-get install redshift redshift-gtk
    sudo apt-get install taskwarrior
}

install-ruby-utils() {

    # Rubocup: Ruby static code analysis
    #http ://github.com/bbatsov/rubocopwitter_stream.filter(track=[t])
    gem install rubocop
}

instal-python-utils() {
    sudo apt-get install python-dev 
    sudo apt-get install python3-dev
}

install-ag() { 
    apt-get install silversearcher-ag
}


install-fzf() {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    #For Update FZF
	#cd ~/.fzf && git pull && ./install
}

install-z() {
    # Repository link: https://github.com/rupa/z
    # Download to latest to home dir
    wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh
    # Add to .bashrc
    echo . /path/to/z.sh >> ~/.bashrc
    # Add to .zshrc
    echo . /path/to/z.sh >> ~/.zshrc
    
    cd /usr/local/bin
    sudo curl -O https://raw.githubusercontent.com/rupa/z/master/z.sh
    sudo chmod 775 z.sh
    . /usr/local/bin/z.sh
}

install-fasd() {
    #Ubuntu
    #add-apt-repository ppa:fcwu-tw/ppa
    #apt-get update 
    #apt-get install fasd
    git clone https://github.com/clvv/fasd.git ~/Downloads/fasd
    cd ~/Downloads/fasd/; sudo make install; cd ..; rm -rf fasd
}



print-done() {
    echo ""
    echo "Done..."
    echo ""
}


install-docker() {
	# Install Docker
	sudo apt-get install docker.io

}

install-latex() {
	sudo apt-get install texlive-full
	sudo apt-get install biber
	sudo apt-get install latex-beamer
    sudo apt-get install pandoc
    sudo apt-get install pandoc-citeproc
}

main() {
    #upgrade-to-testing
    install-neovim
}

main


#aptitude install terminator
#aptitude install guake
#aptitude install htop
#aptitude install preload
#aptitude install firmware-realtek

