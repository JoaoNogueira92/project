import pandas as pd
import tiledb
import numpy as np
import time
import tiledb.sql


start_time = time.time()

db = tiledb.sql.connect(init_command="SET GLOBAL time_zone='+00:00'")


for chunk in pd.read_sql(sql='SELECT it.id,'
'i.id_item_type,'
'i.comment,'
'it.name '
'FROM `item_array` as i, `item_type_array` as it '
'WHERE it.id = i.id_item_type '
'GROUP BY it.id, i.id_item_type, i.comment, it.name',
con=db, chunksize=100):
    print(chunk)


elapsed_time = time.time() - start_time

print(elapsed_time*1000)
#avg execution time: 0.19580531120300293
