# archlinux-dump1090-fa

### dump1090-fa for Arch Linux & Arch Linux Arm


### OPTION-1: Fully automated install:</br>The installation script creates a dedicated folder "/usr/share/dump1090-fa-builder" and all cloned code and built packages are saved in it
Copy paste the script below in terminal and press Enter Key. The script will do everything for you, except that it will ask you provide password and your permission [yes/no] when installing packages of build tools and dependencies, and of course for installing dump1090-fa itself..

```
bash -c "$(wget -O - https://github.com/abcd567a/archlinux-dump1090-fa/raw/master/dump1090-fa-builder.sh)"  

```



### OPTION-2: Manual Install:

```
sudo pacman -S --needed git fakeroot make pkgconf gcc debugedit 

git clone https://github.com/abcd567a/archlinux-dump1090-fa.git   

cd archlinux-dump1090-fa

makepkg -si
```

</br>

</br>

**The cloned directory contains following files**

- PKGBUILD
- dump1090-fa.install
- README.md
- rtl-sdr.rules
- build-dump1090-fa.sh 


The command `makepkg -si` will run the PKGBUILD script which will: 

1. Check for conflicts with existing other versions of dump1090
2. Offer to install dependencies rtl-sdr, lighttpd, and bladerf [Yes/no]
3. Clones dump1090-fa source code from Flightaware's Github Repository
4. Build package `dump1090-fa-*.pkg.tar.xz` or `dump1090-fa-*.pkg.tar.zst`
5. Offer to install the above package [Yes/no]

The above package can be install later also by following command:
```
cd archlinux-dump1090-fa 
sudo pacman -U dump1090-fa-*.pkg.tar.*
```



***
##  T H I N G S - TO -  DO (AFTER INSTALLATION IS COMPLETED)
***

### IMPORTANT: REBOOT COMPUTER/RPi
**OTHERWISE DUMP1090-FA WILL FAIL TO START** </br>
**AND A NOTICE "FAILED TO FETCH DATA" WILL APPEARS ON THE MAP, OR MAP WILL NOT SHOW** </br></br>



**To make SkyView Map show receiver location & range rings, do following:** </br>

1. Open file "dump1090-fa" for editing  </br>
    `sudo nano  /etc/default/dump1090-fa`  </br>

2. In the opened file, go to following lines: </br>
`RECEIVER_LAT=` </br>
`RECEIVER_LON=` </br>
 
   In above line, add your latitude and longitude, so the line becomes like below:  </br>
   `RECEIVER_LAT=xx.xxxx` </br>
   `RECEIVER_LON=yy.yyyy` </br>

   NOTE: Repalce xx.xxxx and yy.yyyy by your actual latitude and Longitude  </br>
    


3. Restart dump1090-fa </br>

    `sudo systemctl restart dump1090-fa `  </br>

4. Clear browser cache and reload browser </br></br>
   See map at </br>
   `localhost/skyaware/` from same computer </br>
   OR </br>
   `IP-of-Archlinux-Computer/skyaware/` from another computer </br>

**To check status:**
`sudo systemctl status dump1090-fa `

**To restart:**
`sudo systemctl restart dump1090-fa `

</br>
</br>
