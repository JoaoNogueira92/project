//Station position by date
PROFILE
MATCH (s:Station), (ec:Estimated_coordinates)
WHERE s.id = ec.id_station
WITH s, ec
SKIP 0
LIMIT 1000000
RETURN s.id, s.name, s.id_station_type, ec.x, ec.y, ec.z, ec.epoch 
ORDER BY ec.epoch