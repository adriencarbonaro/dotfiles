# Headless network setup on Rapsberry Pi

How to setup network (wifi, ethernet, ssh) on a Raspberry Pi with a headless setup (no screen / no keyboard). 

## I. Raspbian installation

First you need to install a linux distribution on the Rapsberry Pi card. There are two ways to do it. If you use Balena Etcher, go to **ssh setup** section.

### 1. Balena Etcher (on Windows, Mac and Linux)

- Download Balena Etcher on www.balena.io/etcher.
- Download a Raspbian image on raspberrypi.org/downloads/raspbian.
- Connect the SD card on your computer.
- Flash the image on the SD card using Etcher.
- Jump to **SSH Setup** section

### 2. Command line (on Linux)

- Download a Raspbian image on raspberrypi.org/downloads/raspbian.
- Run `lsblk` to see which devices are currently connected to your machine.
  
- If your computer has a slot for SD cards, insert the card. If not, insert the card into an SD card reader, then connect the reader to your computer.

- Run `lsblk` again. The new device that has appeared is your SD card (you can also usually tell from the listed device size). The naming of the device will follow the format described in the next paragraph.
  
- The left column of the results from the `lsblk` command gives the device name of your SD card and the names of any partitions on it (usually only one, but there may be several if the card was previously used). It will be listed as something like `/dev/mmcblk0` or `/dev/sdX` (with partition names `/dev/mmcblk0p1` or `/dev/sdX1` respectively), where `X` is a lower-case letter indicating the device (eg. `/dev/sdb1`). The right column shows where the partitions have been mounted (if they haven't been, it will be blank).
  
- If any partitions on the SD card have been mounted, **unmount** them all with `umount`, for example `umount /dev/sdX1` (replace `sdX1` with your SD card's device name, and change the number for any other partitions).

#### Copying the image to the SD card

- In a terminal window, write the image to the card with the command below, making sure you replace the input file `if=` argument with the path to your `.img` file, and the `/dev/sdX` in the output file `of=` argument with the correct device name. **This is very important, as you will lose all the data on the hard drive if you provide the wrong device name.** Make sure the device name is the name of the **whole SD card** as described above, not just a partition. For example: `sdb`, not `sdb1` ; `mmcblk0`, not `mmcblk0p1`.    
    ```bash
    sudo dd bs=4M if=2018-11-13-raspbian-stretch.img of=/dev/sdX status=progress conv=fsync
    ```

- Please note that block size set to `4M` will work most of the time. If not, try `1M`, although this will take considerably longer.

## II. SSH setup

- First boot your Raspberry Pi with the card. Wait for 10 seconds.
- Switch off the card and plug the SD card in the computer. Mount it.
- Go to `/boot` folder of the SD card. Create an empty file called `ssh`. (In Linux, use this command : `touch ssh`).

## III. wpa_supplicant.conf

In order to set up the wifi or ethernet connection, you need to create a containing network info. This file is called `wpa_supplicant.conf`. Place this file in the `/root` partition of the SD card. This file is containing the following : 

*wpa_supplicant.conf*

```bash
country=FR
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
	ssid="ssid"
	scan_ssid=1
	psk="password"
	key_mgmt=WPA-PSK
}	
```

## IV. Change hostname

In order to connect to your Raspberry Pi using `ssh pi@my_raspberry` instead of `ssh pi@192.168.X.X`, you need to change the hostnames in your computer. To do that, go to `/etc/` directory in the computer and change the last line of `hosts` file. (In the file, `192.168.X.X` is the raspberry's IP on your network).

*/etc/hosts/* :

```
127.0.0.1 localhost

192.168.1.X my_raspberry
```
