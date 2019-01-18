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

# Выгрузить/обновить сорцы на crowdin
crowdin -c baikalos_crowdin/config/pi.yaml upload

# Выгрузить имеющиеся в исходниках переводы
#crowdin -c baikalos_crowdin/config/pi.yaml upload  translations

