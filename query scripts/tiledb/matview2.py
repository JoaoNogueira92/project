import pandas as pd
import tiledb
import numpy as np
import time

start = time.time()
# Open the TileDB array
array_uri = "/home/joao/Desktop/project/stations_array"  # Replace with the URI of your TileDB array
array_station = tiledb.open(array_uri)

array_uri = "/home/joao/Desktop/project/method_identification_array"
array_method_identification = tiledb.open(array_uri)

array_uri = "/home/joao/Desktop/project/analysis_centers_array"
array_analysis_centers = tiledb.open(array_uri)

array_uri = "/home/joao/Desktop/project/product_files"
array_product_files = tiledb.open(array_uri)

array_estimated_coordinates = tiledb.open("/home/joao/Desktop/project/estimated_coordinates_array_2")


result_stationtest =  array_station.query()
result_analysistest = array_analysis_centers.query()
result_prodtest = array_product_files.query()
mi = array_method_identification.query(attrs=["id", "creation_date","doi", "data_type", "version", "id_analysis_centers"])
ec = array_estimated_coordinates.query(attrs=["id_method_identification","id_product_files","id_station"])





# Create empty lists to store the results
data = {
    "id_station": [],
    "marker": [],
    "id_mi": [],
    "id_ac": [],
    "abbreviation": [],
    "data_type": [],
    "version": [],
    "creation_date": [],
    "doi": [],
    "min_epoch": [],
    "max_epoch": [],
    "sampling_period": []
}

pd.set_option('display.max_rows', 10000)

ec_mi = np.asarray(ec[:]["id_method_identification"])
ec_pf = np.asarray(ec[:]["id_product_files"])
ec_st = np.unique(ec[:]["id_station"])
mi_id = np.asarray(mi[:]["id"])
mi_cd = np.asarray(mi[:]["creation_date"])
mi_doi = np.asarray(mi[:]["doi"])
mi_dt = np.asarray(mi[:]["data_type"])
mi_v = np.asarray(mi[:]["version"])


for el in ec_mi:
    print(el)

for el in ec_pf:
    print(el)

for el in ec_st:
    print(el)

for el in mi_id:
    print(el)

for el in mi_cd:
    print(el)

for el in mi_doi:
    print(el)

for el in mi_dt:
    print(el)

for el in mi_v:
    print(el)


elapsed_time = time.time() - start
print(elapsed_time)

#elapsed time  81.56174302101135
