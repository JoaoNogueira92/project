import pandas as pd
import tiledb
import numpy as np
import time
import tiledb.sql


# Open the TileDB array
array_uri = "/home/joao/Desktop/project/stations_array"  # Replace with the URI of your TileDB array
array_station = tiledb.open(array_uri)

array_uri = "/home/joao/Desktop/project/method_identification_array"
array_method_identification = tiledb.open(array_uri)

array_uri = "/home/joao/Desktop/project/analysis_centers_array"
array_analysis_centers = tiledb.open(array_uri)

array_uri = "/home/joao/Desktop/project/product_files"
array_product_files = tiledb.open(array_uri)


start_time = time.time()

db = tiledb.sql.connect(init_command="SET GLOBAL time_zone='+00:00'")
#for chunk in pd.read_sql(sql='SELECT DISTINCT ec.id_station, s.marker,'
#'ec.id_method_identification AS id_mi,' 
#'ac.id AS id_ac, ac.abbreviation,' 
#'mi.data_type,' 
#'mi.version,' 
#'mi.creation_date,'
#'mi.doi,min(ec.epoch) AS min_epoch,' 
#'max(ec.epoch) AS max_epoch,' 
#'pf.sampling_period '
#'FROM `estimated_coordinates_array` ec, `method_identification_array` mi, `analysis_centers_array` ac, `stations_array` s, `product_files` pf ' 
#'WHERE ec.id_method_identification = mi.id AND mi.id_analysis_centers = ac.id AND ec.id_station = s.id AND ec.id_product_files = pf.id '
#'GROUP BY ec.id_station, ec.id_method_identification, mi.id, mi.creation_date, mi.doi, mi.data_type, mi.version, ac.id, ac.abbreviation, s.id, s.marker, pf.sampling_period '
#'ORDER BY s.marker, (min(ec.epoch)), (max(ec.epoch)), pf.sampling_period LIMIT 1000', con=db, chunksize=10000):
#    print(chunk)

for chunk in pd.read_sql(sql='SELECT * FROM `estimated_coordinates_array` LIMIT 4000000', con=db, chunksize=10000):
    print(chunk)

elapsed_time = time.time() - start_time

print(elapsed_time*1000)


#group by ec.id_station, ec.id_method_identification, mi.id, mi.creation_date, mi.doi, mi.data_type, mi.version, ac.id, ac.abbreviation, s.id, s.marker, pf.sampling_period order by s.marker, pf.sampling_period