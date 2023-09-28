#!/bin/bash
local exist=$(aws s3 ls s3://market-app-bucket-prod-liron/ | grep counter.txt)
if [ -z $exist ]; then
touch counter.txt && echo "0" > counter.txt && aws cp counter.txt s3://market-app-bucket-prod-liron/
else
counter=aws s3 cp s3://market-app-bucket-prod-liron/counter.txt
counter=$counter+1
echo $counter > counter.txt
aws s3 sync ./counter.txt s3://market-app-bucket-prod-liron/counter.txt
fi
echo $counter
#test10