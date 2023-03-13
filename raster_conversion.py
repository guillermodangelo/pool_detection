from qgis.core import *
import qgis.utils
import os

crs = QgsCoordinateReferenceSystem('EPSG:32721')
qinst = QgsProject.instance()
base_path = '/home/guillermo/Documents/GitHub/pool_detection/'


files = os.listdir(os.path.join(base_path, 'images'))

for file in files:
    if file[-3:] == 'jpg':
        print(f'Processing file {file}')
        raster = file[:-4]
        output_path = os.path.join(base_path, 'images_tif', f'{raster}.tif')
        
        if os.path.isfile(output_path):
            print('File exists, skipping')
        else:
            processing.run("gdal:translate", {
                'INPUT': os.path.join(base_path, f'images/{raster}.jpg'),
                'SOURCE_CRS': crs,
                'TARGET_CRS': crs,
                'OPTIONS':'COMPRESS=DEFLATE|PREDICTOR=2|ZLEVEL=9',
                'OUTPUT': output_path
                })
