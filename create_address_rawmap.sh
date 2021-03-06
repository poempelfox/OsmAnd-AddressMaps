#!/bin/bash

#
# hvdwolf@gmail.com, 20160318
# Quick and dirty script to download raw country file from geofabrik,
# remove all unnecessary data and only keep address (related) data
# Convert back to format for OsmAndMapCreator to create address obf file



country="$1"

wget download.geofabrik.de/europe/${country}-latest.osm.pbf -O ${country}-latest.osm.pbf

osmconvert -v ${country}-latest.osm.pbf --drop-version --out-o5m > ${country}-latest.o5m

osmfilter ${country}-latest.o5m -v --keep="addr:* boundary=administrative =postal_code admin_level= place= highway=" --out-o5m > ${country}-address.o5m

osmconvert -v ${country}-address.o5m --out-pbf > ${country}-address.osm.pbf

rm *.o5m
