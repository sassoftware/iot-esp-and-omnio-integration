#! /bin/bash
#Copyright © 2019, SAS Institute Inc., Cary, NC, USA.  All Rights Reserved.
#SPDX-License-Identifier: Apache-2.0

cd /opt/esp_scripts

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export DFESP_HOME=/opt/sas/viya/home/SASEventStreamProcessingEngine/6.1
echo $DFESP_HOME 
export LD_LIBRARY_PATH=$DFESP_HOME/lib:/opt/sas/viya/home/SASFoundation/sasexe
echo $LD_LIBRARY_PATH
export PATH=$PATH:$DFESP_HOME/bin

#Start the esp server with the model file
$DFESP_HOME/bin/dfesp_xml_server -model file://solarfarm_omnio_sst_model.xml -http 40000 -pubsub 40001 > /dev/null 2>&1 &

sleep 10
#Start the streamviewer process
/opt/esp_scripts/SASEventStreamProcessingEngine/5.2/bin/streamviewer.sh -product h2 -h2file /db/h2db.ravi -http 52500 -noauth >/dev/null 2>&1 & 
