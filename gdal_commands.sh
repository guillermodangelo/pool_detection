cd C:\OSGeo4W\bin

-- sin canal alpha
-- vrt
gdalbuildvrt.exe -a_srs EPSG:32721 -overwrite C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_utm.vrt -input_file_list C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/for_vrt.txt

-- convierte a geotiff
gdal_translate.exe -tr 0.25 0.25 -co PREDICTOR=2 -co COMPRESS=JPEG -of GTiff -a_srs EPSG:32721 -co BIGTIFF=NO -co TILED=YES -co NUM_THREADS=ALL_CPUS C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_utm.vrt C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_utm.tif

-- overviews
gdaladdo --config COMPRESS_OVERVIEW JPEG --config PHOTOMETRIC_OVERVIEW YCBCR --config INTERLEAVE_OVERVIEW PIXEL -r average C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_utm.tif 2 4 8 16 32 64 128 256 512

-- sube al servidor
scp C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_utm.tif root@162.212.155.144:./geoserver/raster_data/vuelo_aoi_utm.tif

-- copia al contenedor
docker cp ./raster_data/vuelo_aoi_utm.tif kartozageoserver-geoserver-1:/opt/geoserver/data_dir/vuelo_aoi_utm.tif


-- con canal alfa y compresion LZW
-- vrt
gdalbuildvrt.exe -a_srs EPSG:32721 -overwrite C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_utm.vrt -input_file_list C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/for_vrt.txt

-- convierte a geotiff
gdal_translate.exe -tr 0.25 0.25 -co PREDICTOR=2 -co COMPRESS=LZW -of GTiff -a_srs EPSG:32721 -co BIGTIFF=NO -co TILED=YES -co NUM_THREADS=ALL_CPUS C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_utm.vrt C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_utm.tif

-- reproyecta y enmascara
gdalwarp -multi -wo NUM_THREADS=ALL_CPUS -crop_to_cutline -srcnodata 0 -dstalpha -overwrite -s_srs EPSG:32721 -t_srs EPSG:32721 -cutline C:\Users\59898\Documents\GitHub\pool_detection\raster_for_webmap\buffered_aoi.shp C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_utm.tif C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_web_masked.tif

-- vuelve a comprimir
gdal_translate.exe -tr 0.25 0.25 -co PREDICTOR=2 -co COMPRESS=LZW -of GTiff -co BIGTIFF=NO -co TILED=YES -co "BLOCKXSIZE=512" -co "BLOCKYSIZE=512" -co NUM_THREADS=ALL_CPUS C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_web_masked.tif C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_web_masked_optimized.tif

-- overviews
gdaladdo --config COMPRESS_OVERVIEW DEFLATE -r average C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_web_masked_optimized.tif 2 4 8 16 32 64 128 256 512

-- copia al servidor
scp C:/Users/59898/Documents/GitHub/pool_detection/raster_for_webmap/vuelo_aoi_web_masked_optimized.tif root@162.212.155.144:./geoserver/raster_data/vuelo_aoi_web_masked_optimized.tif

-- copia al contenedor
docker cp ./raster_data/vuelo_aoi_web_masked_optimized.tif kartozageoserver-geoserver-1:/opt/geoserver/data_dir/vuelo_aoi_web_masked_optimized.tif
