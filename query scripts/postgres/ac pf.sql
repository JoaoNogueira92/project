
EXPLAIN ANALYZE
SELECT
pf.id_analysis_centers,
pf.url,
pf.epoch,
pf.version,
pf.file_type,
ac.id,
ac.name
FROM product_files pf,
analysis_centers ac
WHERE pf.id_analysis_centers = ac.id
GROUP BY pf.id, pf.url, pf.epoch, pf.version, pf.file_type, ac.name, ac.id
ORDER BY pf.epoch
LIMIT 1000000