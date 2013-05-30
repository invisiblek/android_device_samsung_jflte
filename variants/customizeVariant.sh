#!/sbin/sh
# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Allows customization for various jflte variants.
#
#
# Portions of this procedure leverages the loki_patch utility created by djrbliss which allows us
# to bypass the bootloader checks on jfltevzw and jflteatt
# See here for more information on loki: https://github.com/djrbliss/loki
#

#att
cat /proc/cmdline|egrep -q '(bootloader=I337UCUAMDB)|(bootloader=I337UCUAMDL)'
if [ $? = 0 ];
    then
       cd /tmp
       chmod 777 loki_patch
       dd if=/dev/block/platform/msm_sdcc.1/by-name/aboot of=aboot.img
       ./loki_patch boot aboot.img boot.img boot.lok
       dd if=/tmp/boot.lok of=/dev/block/platform/msm_sdcc.1/by-name/boot
       #customize build.prop
       sed -e 's|ro.build.fingerprint=custom|ro.build.fingerprint=samsung/jflteuc/jflteatt:4.2.2/JDQ39/I337UCUAMDL:user/release-keys|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|ro.build.description=custom|ro.build.description=jflteuc-user 4.2.2 JDQ39 I337UCUAMDL release-keys|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jflteatt|g' /system/build.prop > temp && move temp /system/build.prop 
       sed -e 's|ro.product.model=jflte|ro.product.model=SGH-I337|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jflteatt|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|ro.cm.device=jflt|ro.cm.device=jflteatt|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.01||g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.02|# system.prop for SGH-I337|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.03|#|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.04|rild.libargs=-d /dev/smd0|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.05||g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.06|# Fields for custom RIL|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.07|# MAX PROP NAME is 31 chars ---|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.08|ro.telephony.ril_class=SamsungQualcommUiccRIL|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.09|telephony.lteOnGsmDevice=1|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.10|ro.telephony.default_network=9|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.11||g' /system/build.prop > temp && move temp /system/build.prop
       awk '!/#build.prop.custom/' /system/build.prop > temp && move temp /system/build.prop
fi

#vzw
cat /proc/cmdline|grep -q bootloader=I545VRUAMDK
if [ $? = 0 ];
    then
       cd /tmp
       chmod 777 loki_patch
       dd if=/dev/block/platform/msm_sdcc.1/by-name/aboot of=aboot.img
       ./loki_patch boot aboot.img boot.img boot.lok
       dd if=/tmp/boot.lok of=/dev/block/platform/msm_sdcc.1/by-name/boot
       #customize build.prop
       sed -e 's|ro.build.fingerprint=custom|ro.build.fingerprint=Verizon/jfltevzw/jfltevzw:4.2.2/JDQ39/I545VRUAMDK:user/release-keys|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|ro.build.description=custom|ro.build.description=jfltevzw-user 4.2.2 JDQ39 I545VRUAMDK release-keys|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jfltevzw|g' /system/build.prop > temp && move temp /system/build.prop 
       sed -e 's|ro.product.model=jflte|ro.product.model=SGH-I545|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jfltevzw|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|ro.cm.device=jflt|ro.cm.device=jfltevzw|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.01||g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.02|# system.prop for SCH-I545|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.03|#|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.04|rild.libargs=-d /dev/smd0|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.05||g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.06|# Fields for custom RIL|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.07|# MAX PROP NAME is 31 chars ---|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.08|ro.telephony.ril_class=SamsungCDMAQualcommRIL|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.09|ro.cdma.home.operator.numeric=310004|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.10|ro.cdma.home.operator.alpha=Verizon|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.11|ro.telephony.default_network=8|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.12|telephony.lteOnCdmaDevice=1|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.13||g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.14|# Moar ril props|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.15|persist.radio.snapshot_enabled=1|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.16|persist.radio.snapshot_timer=22|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.17|ro.config.multimode_cdma=1|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.18|ro.config.combined_signal=true|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.19|ro.gsm.data_retry_config=max_retries=infinite,5000,5000,60000,120000,480000,900000|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.20|DEVICE_PROVISIONED=1|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.21|persist.eons.enabled=false|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.22||g' /system/build.prop > temp && move temp /system/build.prop
       awk '!/#build.prop.custom/' /system/build.prop > temp && move temp /system/build.prop
fi

#can
cat /proc/cmdline|grep -q SGH-I337M
if [ $? = 0 ];
    then
       cd /tmp
       dd if=/tmp/boot.img of=/dev/block/platform/msm_sdcc.1/by-name/boot
       #customize build.prop
       sed -e 's|ro.build.fingerprint=variantcustom|ro.build.fingerprint=samsung/jfltevl/jfltecan:4.2.2/JDQ39/I337MVLUAMDJ:user/release-keys|g' build.prop > build.tmp
       sed -e 's|ro.build.description=variantcustom|ro.build.description=jfltevl-user 4.2.2 JDQ39 I337MVLUAMDJ release-keys|g' build.tmp > build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jfltecan|g' build.prop > build.tmp 
       sed -e 's|ro.product.model=jflte|ro.product.model=SGH-I337M|g' build.tmp > build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jfltecan|g' build.prop > build.tmp
       sed -e 's|ro.cm.device=jflt|ro.cm.device=jfltecan|g' build.tmp > build.tmp
       sed -e 's|#build.prop.custom.01||g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.02|# system.prop for SGH-I337M|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.03|#|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.04|rild.libargs=-d /dev/smd0|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.05||g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.06|# Fields for custom RIL|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.07|# MAX PROP NAME is 31 chars ---|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.08|ro.telephony.ril_class=SamsungQualcommUiccRIL|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.09|telephony.lteOnGsmDevice=1|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.10|ro.telephony.default_network=9|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.11||g' /system/build.prop > temp && move temp /system/build.prop
       awk '!/#build.prop.custom/' /system/build.prop > temp && move temp /system/build.prop
fi

#tmo
cat /proc/cmdline|grep -q SGH-M919
if [ $? = 0 ];
    then
       cd /tmp
       dd if=/tmp/boot.img of=/dev/block/platform/msm_sdcc.1/by-name/boot
       #customize build.prop
       sed -e 's|ro.build.fingerprint=custom|ro.build.fingerprint=samsung/jfltetmo/jfltetmo:4.2.2/JDQ39/M919UVUAMDB:user/release-keys|g' build.prop > build.tmp
       sed -e 's|ro.build.description=custom|ro.build.description=jfltetmo-user 4.2.2 JDQ39 M919UVUAMDB release-keys|g' build.tmp > build.prop
       sed -e 's|PRODUCT_DEVICE := jflte|PRODUCT_DEVICE := jfltetmo|g' build.prop > build.tmp 
       sed -e 's|ro.product.model=jflte|ro.product.model=SGH-M919|g' build.tmp > build.prop
       sed -e 's|ro.product.device=jflte|ro.product.device=jfltetmo|g' build.prop > build.tmp
       sed -e 's|ro.cm.device=jflt|ro.cm.device=jfltetmo|g' build.tmp > build.tmp
       sed -e 's|#build.prop.custom.01||g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.02|# system.prop for SGH-M919|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.03|#|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.04|rild.libargs=-d /dev/smd0|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.05||g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.06|# Fields for custom RIL|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.07|# MAX PROP NAME is 31 chars ---|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.08|ro.telephony.ril_class=SamsungQualcommUiccRIL|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.09|telephony.lteOnGsmDevice=1|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.10|ro.telephony.default_network=9|g' /system/build.prop > temp && move temp /system/build.prop
       sed -e 's|#build.prop.custom.11||g' /system/build.prop > temp && move temp /system/build.prop
       awk '!/#build.prop.custom/' /system/build.prop > temp && move temp /system/build.prop
fi

# cleanup
       rm /system/bin/loki.sh
       rm /system/bin/loki_patch



