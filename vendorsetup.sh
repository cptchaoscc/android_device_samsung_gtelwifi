# copy stuff first
cp device/samsung/gtelwifi/device_mk/common_full_tablet_wifionly.mk vendor/arrow/config/common_full_tablet_wifionly.mk;
cp device/samsung/gtelwifi/device_mk/phone-hdpi-2048-dalvik-heap.mk frameworks/native/build/phone-hdpi-2048-dalvik-heap.mk;
cp device/samsung/gtelwifi/device_mk/phone-xxhdpi-2048-hwui-memory.mk frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk;

add_lunch_combo arrow_gtelwifi-eng
add_lunch_combo arrow_gtelwifi-userdebug
add_lunch_combo arrow_gtelwifi-user
