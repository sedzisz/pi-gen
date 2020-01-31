#!/bin/bash -e

install -m 644 files/cmdline.txt "${ROOTFS_DIR}/boot/"
install -m 644 files/config.txt "${ROOTFS_DIR}/boot/"

enable_usb_ethernet_in_cmdline(){

}

enable_usb_ethernet_in_config_file()
{
cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"

# Ethernet over USB
dtoverlay=dwc2
EOF
}

if [ "${ETHERNET_USB}" == "1" ]; then
	enable_usb_ethernet_in_config_file
	enable_usb_ethernet_in_cmdline
fi
