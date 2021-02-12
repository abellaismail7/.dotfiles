#!/bin/sh
alias install="sudo xbps-install -S"
projects="$HOME/projects"


install u
install git zsh make gcc curl

mkdir $projects

git clone --bare "https://github.com/abellaismail7/.dotfiles" "$projects/.dotfiles"


function config {
   /usr/bin/git --git-dir=$projects --work-tree=$HOME $@
}

function trimSSD {
	sudo sh -c 'echo -e "#!/bin/sh \n\n fstrim /" > /etc/cron.daily/fstrim'
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



# enable SDD triming
lsblk -Drpno "NAME,DISC-GRAN,DISC-MAX,MOUNTPOINT" | awk '$2 != "0B" && $3 != "0B" && $4 == "/"{print $1}' | grep "/dev" && trimSSD
chmod u+x /etc/cron.weekly/fstrim

# if laptop => save battery
type=$(cat /sys/class/dmi/id/chassis_type)
if [ "$type" = "9" ];then
	install tlp
	ln -s /etc/sv/tlp /var/service
	sv up tlp
fi


# install network manager
install NetworkManager
rm /var/service/dhcpcd
rm /var/service/wpa_supplicant
rm /var/service/wicd

ln -s /etc/sv/dbus /var/service


# intel bullshit
install void-repo-nonfree intel-ucode linux-firmware-intel mesa-dri vulkan-loader mesa-vulkan-intel intel-video-accel

## xorg
install xorg-minimal xorg-fonts xterm xinit

# xf86-video installation
isdone=0
while [ $isdone -eq 0];do
	isdone=1
	echo "GPU manufacter:"
	echo "1-intel \n 2-vmware \n 3-AMD|ATI \n 4-NVIDIA"
	
	read manufacter
	
	case $manufacter in
		1) 
			install xf86-video-intel ;;
		2) 
			install xf86-video-vmware ;;
		3) 
			install xf86-video-ati ;;
		4) 
			install xf86-video-nouveau ;;
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



































