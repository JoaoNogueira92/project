//WORK ON THIS, ALOMOST THERE BOOOOOOOOOOY
PROFILE
MATCH (ec:Estimated_coordinates), (mi:Method_identification), (ac:analysis_centers), (st:Station), (pf:product_files)
WHERE ec.id_method_identification = mi.id AND mi.id_analysis_centers = ac.id AND ec.id_station = st.id AND ec.id_product_files = pf.id 
WITH ec, mi, ac, st, pf
SKIP 0
LIMIT 5000000
RETURN DISTINCT ec.id_station, ec.id_method_identification, mi.id, mi.creation_date, mi.doi, mi.data_type, mi.version, ac.id, ac.abbreviation, st.id, st.marker, pf.sampling_period
ORDER BY s.marker, pf.sampling_period


Cypher version: , planner: COST, runtime: PIPELINED. 135915626 total db hits in 41733 ms.
Cypher version: , planner: COST, runtime: PIPELINED. 268509916 total db hits in 86653 ms.
Cypher version: , planner: COST, runtime: PIPELINED. 298231484 total db hits in 98687 ms.

total execution time: 227073 ms









EXPLAIN ANALYZE
 SELECT DISTINCT ec.id_station,
    s.marker,
    ec.id_method_identification AS id_mi,
    ac.id AS id_ac,
    ac.abbreviation,
    mi.data_type,
    mi.version,
    mi.creation_date,
    mi.doi,
    min(ec.epoch) AS min_epoch,
    max(ec.epoch) AS max_epoch,
    pf.sampling_period
   FROM estimated_coordinates ec,
    method_identification mi,
    analysis_centers ac,
    station s,
    product_files pf
  WHERE ec.id_method_identification = mi.id AND mi.id_analysis_centers = ac.id AND ec.id_station = s.id AND ec.id_product_files = pf.id
  GROUP BY ec.id_station, ec.id_method_identification, mi.id, mi.creation_date, mi.doi, mi.data_type, mi.version, ac.id, ac.abbreviation, s.id, s.marker, pf.sampling_period
  ORDER BY s.marker, (min(ec.epoch)), (max(ec.epoch)), pf.sampling_period


"Planning Time: 17.386 ms"
"Execution Time: 55030.772 ms"