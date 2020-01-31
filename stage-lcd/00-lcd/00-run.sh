#!/bin/bash -e

enable_fbcp()
{
install -m 644 files/fbcp "${ROOTFS_DIR}/bin/"
cat << EOF >> /etc/modules
#Enable LCD on boot time.
fbtft_device
EOF
}

enable_lcd_waveshare_st7735s()
{
cat << EOF >> /etc/modprobe.d/options.conf
options fbtft_device name=adafruit18_green gpios=reset:27,dc:25,cs:8,led:24 speed=40000000 bgr=1 fps=60 custom=1 height=128 width=128 rotate=90
EOF
}

if [ "${ENABLE_LCD_WAVESHARE_ST7735S}" == "1" ]; then
	enable_fbcp
	enable_ethernet_over_usb
fi
