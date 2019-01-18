#!/bin/bash

DIRROOT=/opt/ssd/baikal9
### repo sync ###
cd $DIRROOT
repo sync frameworks/base/ --force-sync
repo sync packages/apps/BaikalOSExtras/ --force-sync
repo sync packages/apps/Settings/ --force-sync
repo sync device/leeco/msm8996-common/ --force-sync
repo sync device/xiaomi/msm8998-common/ --force-sync
repo sync device/xiaomi/sdm845-common/ --force-sync

### update pi ###
# base
cd frameworks/base/
git checkout pi
git pull baikalos pi
cd $DIRROOT

# BaikalOS Extras
cd packages/apps/BaikalOSExtras/
git checkout pi
git pull baikalos pi
cd $DIRROOT

# Settings
cd packages/apps/Settings/
git checkout pi
git pull baikalos pi
cd $DIRROOT

# Devices
# Leeco 8996
cd device/leeco/msm8996-common/
git checkout pi
git pull github pi
cd $DIRROOT

# Xiaomi 8998
cd device/xiaomi/msm8998-common/
git checkout pi
git pull github pi
cd $DIRROOT

# Xiaomi 845
cd device/xiaomi/sdm845-common/
git checkout pi
git pull github pi
cd $DIRROOT

### Download latest translation ###
crowdin -c baikalos_crowdin/config/pi.yaml download

### Push latest translation to git ###
# base
cd frameworks/base/
git add *
git commit -a -m "crowdin: import translation"
git push baikalos pi
cd $DIRROOT
 
# BaikalOS Extras
cd packages/apps/BaikalOSExtras/
git add *
git commit -a -m "crowdin: import translation"
git push baikalos pi
cd $DIRROOT

# Settings
cd packages/apps/Settings/
git add *
git commit -a -m "crowdin: import translation"
git push baikalos pi
cd $DIRROOT

# Devices
# Leeco 8996
cd device/leeco/msm8996-common/
git add *
git commit -a -m "crowdin: import translation"
git push github pi
cd $DIRROOT

# Xiaomi 8998
cd device/xiaomi/msm8998-common/
git add *
git commit -a -m "crowdin: import translation"
git push github pi
cd $DIRROOT

# Xiaomi 845
cd device/xiaomi/sdm845-common/
git add *
git commit -a -m "crowdin: import translation"
git push github pi
cd $DIRROOT
