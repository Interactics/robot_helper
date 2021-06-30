echo ""
echo "Create udev_rules in /etc/udev/rules.d/"
echo ""

echo "Change USB tty Device Name -> From /dev/ttyUSBx to /dev/ttyNAME :"
if [ -f "/etc/udev/rules.d/99-usb-device.rules" ]; then
    echo "99-usb-device file already exist."
else 
    echo 'SUBSYSTEM=="tty", ATTRS{idVendor}=="9999", ATTRS{idProduct}=="9999", MODE:="0666", GROUP:="dialout", SYMLINK+="ttyNAME"' > /etc/udev/rules.d/99-usb-device.rules
    
    echo '<99-usb-device.rules> is created'
fi

## if you want to create more shellscript files, then copy and paste scripts 

echo ""
echo "---Reload the udev_rules---"
echo ""

sudo udevadm control --reload-rules
sudo udevadm trigger
