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