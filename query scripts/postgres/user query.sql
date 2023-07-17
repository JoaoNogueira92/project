EXPLAIN ANALYZE
SELECT DISTINCT s.id,
s.name,
s.id_station_type,
u.id,
u.name,
ug.id_user_group
FROM station s, user_group u, user_group_station ug
WHERE s.id = ug.id_station and ug.id_user_group = u.id
GROUP BY s.id, s.name, s.id_station_type, u.id, u.name, ug.id_user_group