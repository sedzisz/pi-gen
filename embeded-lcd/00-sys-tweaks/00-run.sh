#!/bin/bash -e

enable_fbcp()
{
echo "Installing application for cloning framebuffer in to LCD."
install -m 644 files/fbcp "${ROOTFS_DIR}/bin/"
cat >> "${ROOTFS_DIR}/etc/modules" <<EOF 
#Enable LCD on boot time.
fbtft_device
EOF
}

enable_lcd_waveshare_st7735s()
{
echo "Enable configuration for LCD Waveshare ST7735S"
cat  >> "${ROOTFS_DIR}/etc/modprobe.d/options.conf" <<EOF
options fbtft_device name=adafruit18_green gpios=reset:27,dc:25,cs:8,led:24 speed=40000000 bgr=1 fps=60 custom=1 height=128 width=128 rotate=90
EOF
}

main()
{
	enable_fbcp
	enable_lcd_waveshare_st7735s
}


main