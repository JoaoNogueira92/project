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
for chunks in pd.read_sql(sql="select distinct id_station from `estimated_coordinates_array`", con=db, chunksize=100000):
        print(chunks)

# Process the unique station IDs
#for station_id in station_ids:
#    print(station_id)

elapsed_time = time.time() - start_time

print(elapsed_time*1000)
# avgexecution time: 0.3162 seconds
