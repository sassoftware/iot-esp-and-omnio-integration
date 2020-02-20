#!/bin/bash
#Copyright © 2019, SAS Institute Inc., Cary, NC, USA.  All Rights Reserved.
#SPDX-License-Identifier: Apache-2.0

#Docker container startup
id=$(docker ps -all -q --filter name=solarfarm-demo)
if [[ -z $id ]]
then
	echo "###Starting the ESP docker container###"
	docker run -d --net=host --name=solarfarm-demo -v ~/SV:/db docker.sas.com/razsha/solarfarm_demo_master
	echo "Starting the IoTtool Box dashboard. Access the dashboard at iotshelf02:8090" 
	pkill -f "java -jar ./toolbox-0.1.3.jar" 
        cd ~/IoT_Toolbox	
	./IoT_Toolbox.sh > toolbox.out 2>&1 &
else
	echo "###Please wait for the container cleanup###"
	docker stop $(docker ps --all -q --filter name=solarfarm-demo)
	docker rm $(docker ps --all -q --filter name=solarfarm-demo)
	echo "###Starting the ESP docker container####"
	docker run -d --net=host --name=solarfarm-demo -v ~/SV:/db docker.sas.com/razsha/solarfarm_demo_master
	echo "Starting the IoTtool Box dashboard. Access the dashboard at iotshelf02:8090"
	pkill -f "java -jar ./toolbox-0.1.3.jar"
	cd ~/IoT_Toolbox
	./IoT_Toolbox.sh > toolbox.out  2>&1 &	

fi
