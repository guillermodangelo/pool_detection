#!/bin/bash
# init

satproc_extract_chips ./images/*.jpg \
    --output-dir "chips" \
    --size 2400 \
    --step-size 2400 \
    --aoi "./aoi.geojson" \
    --crs EPSG:32721 \
    -t jpg \
    --write-footprints \
    --no-skip-existing \
    --labels "./labels.geojson" \
    --label-property 'class' \
    --classes 'P' \
    --within \
    --verbose