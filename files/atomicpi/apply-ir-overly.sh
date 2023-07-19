#!/bin/bash

# Compile the DTS files to DTBO
dtc -@ -I dts -O dtb -o gpio-ir-tx.dtbo gpio-ir-tx.dts
dtc -@ -I dts -O dtb -o gpio-ir-rx.dtbo gpio-ir-rx.dts

# Create the overlays using the sysfs device-tree overlay
sudo mkdir /sys/kernel/config/device-tree/overlays/gpio-ir-tx
sudo mkdir /sys/kernel/config/device-tree/overlays/gpio-ir-rx

# apply overly
sudo cat gpio-ir-tx.dtbo /sys/kernel/config/device-tree/overlays/gpio-ir-tx/dtbo
sudo cat gpio-ir-rx.dtbo /sys/kernel/config/device-tree/overlays/gpio-ir-rx/dtbo
