#!/bin/bash
alias xin="sudo xbps-install -S"
projects="$HOME/projects"


sudo xbps-install -Su
xin git zsh make gcc curl p7zip

mkdir $projects

git clone --bare "https://github.com/abellaismail7/.dotfiles" "$projects/.dotfiles"


function config {
   /usr/bin/git --git-dir=$projects/.dotfiles --work-tree=$HOME $@
}

function trimSSD {
	sudo sh -c 'echo -e "#!/bin/sh \n\n fstrim /" > /etc/cron.daily/fstrim'
	chmod u+x /etc/cron.weekly/fstrim
}

mkdir -p "$HOME/.config-backup"

config checkout

if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

config checkout
config config status.showUntrackedFiles no

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# enable SDD triming
lsblk -Drpno "NAME,DISC-GRAN,DISC-MAX,MOUNTPOINT" | awk '$2 != "0B" && $3 != "0B" && $4 == "/"{print $1}' | grep "/dev" && trimSSD

# if laptop => save battery
type=$(cat /sys/class/dmi/id/chassis_type)
if [ "$type" = "9" ];then
	xin tlp
	ln -s /etc/sv/tlp /var/service
	sv up tlp
fi


# install network manager
xin NetworkManager
rm /var/service/dhcpcd
rm /var/service/wpa_supplicant
rm /var/service/wicd

ln -s /etc/sv/dbus /var/service


# intel bullshit
xin mesa-dri

## xorg
xin xorg-minimal xorg-fonts xterm xinit

# xf86-video installation
isdone=0
while [ $isdone -eq 0];do
	isdone=1
	echo "GPU manufacter:"
	echo "1-intel \n 2-vmware \n 3-AMD|ATI \n 4-NVIDIA"
	
	read manufacter
	
	case $manufacter in
		1) 
			xin xf86-video-intel
			xin void-repo-nonfree intel-ucode linux-firmware-intel vulkan-loader mesa-vulkan-intel intel-video-accel ;;
		2) 
			xin xf86-video-vmware ;;
		3) 
			xin xf86-video-ati ;;
		4) 
			xin xf86-video-nouveau ;;
		*)
			echo "Please enter number between 1-4"
			isdone=0 ;;
	esac

done


# Download fonts
font_jbmn="JetBrainsMonoNerd"
curl -o "$font_jbmn.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip"
7z x "$font_jbmn.zip" -o.$font_jbmn
cp -rf $font_jbmn/*.ttf .local/share/fonts

# libft
xin xorgproto libXrender-devel freetype-devel fontconfig-devel pkg-config
git clone https://gitlab.freedesktop.org/xorg/lib/libxft.git $project/libxft
cd $projects/libxft
curl -Ls https://gitlab.freedesktop.org/xorg/lib/libxft/merge_requests/1.patch | patch -p1
sh autogen.sh --sysconfdir=/etc --prefix=/usr --mandir=/usr/share/man
make
sudo make install

# Suckless
function installSuckless (){
	$([[ -d "$projects/$1" ]] || git clone "https://github.com/abellaismail7/$1.git" "$projects/$1" ) && cd "$projects/$1" && sudo make install 
}
xin libXinerama-devel freetype-devel fontconfig-devel libX11-devel pkg-config
installSuckless dwm
installSuckless dmenu
installSuckless st
installSuckless slblocks

cd $HOME

