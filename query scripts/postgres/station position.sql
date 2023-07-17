EXPLAIN ANALYZE
SELECT s.id,
	s.name,
	s.id_station_type,
    ec.x,
	ec.y,
	ec.z,
	ec.epoch,
	ec.id_station
	FROM station s, estimated_coordinates ec
	WHERE s.id = ec.id_station
	GROUP BY s.id, s.name, s.id_station_type, ec.x, ec.y, ec.z, ec.epoch, ec.id_station
	ORDER BY ec.epoch
	LIMIT 1000000