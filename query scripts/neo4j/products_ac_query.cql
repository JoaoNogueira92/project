//products ac
PROFILE
MATCH (pf:product_files), (ac:analysis_centers)
WHERE pf.id_analysis_centers = ac.id 
WITH pf, ac
SKIP 0
LIMIT 1000000
RETURN pf.id as id, pf.url as url, pf.epoch as date, pf.version as version, pf.filetype as ftype, ac.name as by_analysis_center