# install microsoft fonts
printf "Installing Microsoft Fonts...\n"
sudo apt-get -y install msttcorefonts
 
# install mac fonts
printf "Installing Mac Fonts...\n"
wget http://dl.dropbox.com/u/26209128/mac_fonts.tar.gz
tar zxvf mac_fonts.tar.gz
sudo mv fonts /usr/share/fonts/
sudo fc-cache -f -v
rm -r mac_fonts.tar.gz
 
# install other fonts
printf "Installing other fonts...\n"
sudo apt-get -y install fonts-droid fonts-noto
curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash
 
# improve font-hinting and smoothing similar to Mac OS X
printf "Backing up fonts config file...\n"
mv ~/.fonts.conf{,.old}
 
# create new fonts config file
printf "Updating fonts config file...\n"
printf "<?xml version='1.0'?>\n<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>\n<fontconfig>\n<match target="font">\n<edit mode="assign" name="rgba">\n<const>rgb</const>\n</edit>\n</match>\n<match target="font">\n<edit mode="assign" name="hinting">\n<bool>true</bool>\n</edit>\n</match>
<match target="font">\n<edit mode="assign" name="hintstyle">\n<const>hintslight</const>\n</edit>\n</match>\n<match target="font">\n<edit mode="assign" name="antialias">\n<bool>true</bool>\n</edit>\n</match>\n<match target="font">\n<edit mode="assign" name="lcdfilter">\n<const>lcddefault</const>\n</edit>\n</match>\n</fontconfig>\n" >> ~/.fonts.conf
