import pandas as pd
import tiledb
import numpy as np
import time
import tiledb.sql
# Open the TileDB array


start_time = time.time()
# Query the array

# Retrieve the unique station IDs
#station_ids = np.unique(result[:]["id_station"])

db = tiledb.sql.connect(init_command="SET GLOBAL time_zone='+00:00'")
data =pd.read_sql_query(sql='SELECT DISTINCT id_station FROM `estimated_coordinates_array`', con= db, chunksize = 10000)
# Process the unique station IDs
#for station_id in station_ids:
#    print(station_id)

elapsed_time = time.time() - start_time

print(data)
print(elapsed_time*1000)
#  execution time: 0.5932104587554932 secs




