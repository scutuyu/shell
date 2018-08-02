#! /bin/bash 

ip=10.12.102.134
port=7080
cat data | while read i
do 
    line=$i
    source_id=`echo $line | cut -d ' '  -f 1`
    item_code=`echo $line | cut -d ' '  -f 2`
    description=`echo $line | cut -d ' '  -f 3`
    address=`echo $line | cut -d ' '  -f 4`
    area_code=`echo $line | cut -d ' '  -f 5`
    longitude=`echo $line | cut -d ' '  -f 6`
    latitude=`echo $line | cut -d ' '  -f 7`
    echo $source_id
    echo $item_code
    echo $description
    echo $address
    echo $area_code
    echo $longitude
    echo $latitude
    send_data='{"sourceId":"'$source_id'", "itemCode":"'$item_code'", "description":"'$description'", "address":"'$address'","areaCode":"'$area_code'", "longitude":"'$longitude'", "latitude":"'$latitude'","files":[], "data":{}}'
    send_data="'"$send_data"'"
    param=' -d '$send_data
    command='curl -X POST http://'$ip':'$port'/dcm-web/caseApi/addCase.json -H "Content-Type:application/json"'$param
    # curl -X POST http://$ip:$port/dcm-web/caseApi/addCase.json -H "Content-Type: application/json" $param
    echo $command
    eval $command
done
