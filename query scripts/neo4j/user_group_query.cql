//user group query
PROFILE
MATCH (s:Station), (u:User_group), (us:User_group_station)
WHERE s.id = us.id_station AND us.id_user_group = u.id  
WITH s, u, us
RETURN DISTINCT s.id, s.name, s.id_station_type, u.id, u.name