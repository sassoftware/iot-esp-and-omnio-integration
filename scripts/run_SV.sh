#! /bin/bash
#Copyright © 2019, SAS Institute Inc., Cary, NC, USA.  All Rights Reserved.
#SPDX-License-Identifier: Apache-2.0


cd /opt/esp_scripts
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export DFESP_HOME=/opt/esp_scripts/SASEventStreamProcessingEngine/5.2
export LD_LIBRARY_PATH=$DFESP_HOME/lib:/usr/lib/jvm/
export PATH=$PATH:$DFESP_HOME/bin

/opt/esp_scripts/SASEventStreamProcessingEngine/5.2/bin/streamviewer.sh -http 52500 -h2file /db/h2db.ravi -product h2 -noauth > /dev/null 2>&1 & 
