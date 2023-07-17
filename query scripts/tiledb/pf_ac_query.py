import pandas as pd
import tiledb
import numpy as np
import time
import tiledb.sql


start_time = time.time()

db = tiledb.sql.connect(init_command="SET GLOBAL time_zone='+00:00'")


for chunk in pd.read_sql(sql='SELECT pf.id_analysis_centers,'
'pf.url,'
'pf.epoch,'
'pf.version,'
'pf.file_type,'
'ac.id,'
'ac.name '
'FROM `product_files` pf, `analysis_centers_array` ac ' 
'WHERE pf.id_analysis_centers = ac.id '
'GROUP BY pf.id, pf.url, pf.epoch, pf.version, pf.file_type, ac.name, ac.id '
'ORDER BY pf.epoch '
'LIMIT 1000000',
con=db, chunksize=10000):
    print(chunk)


elapsed_time = time.time() - start_time

print(elapsed_time*1000)

#avg execution time: 0.5206437110900879 secs