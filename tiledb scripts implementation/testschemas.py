import tiledb
import numpy as np
import time

# Open the TileDB array
array_uri = "/home/joao/Desktop/project/estimated_coordinates_array"
array = tiledb.open(array_uri)
print(array.schema)

start_time = time.time()
# Query the array
result = array.query(attrs=["id_station"])

# Retrieve the unique station IDs
station_ids = np.unique(result[:]["id_station"])
elapsed_time = time.time() - start_time



# Process the unique station IDs
for station_id in station_ids:
    print(station_id)


print(elapsed_time)
# Query execution time: 0.3162 seconds
