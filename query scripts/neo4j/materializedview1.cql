PROFILE
MATCH (n:Estimated_coordinates)
RETURN DISTINCT n.id_station AS id_station


Cypher version: , planner: COST, runtime: PIPELINED. 22312585 total db hits in 5485 ms




//POSTGRES QUERY TIME 
//1ST MATERIALIZED VIEW
EXPLAIN ANALYZE
SELECT DISTINCT estimated_coordinates.id_station
   FROM estimated_coordinates


"Planning Time: 0.236 ms"
"Execution Time: 393.505 ms"

//TILEDB FIRST MATERIALIZED VIEW
 Query execution time: 0.3162 seconds




//user group query
PROFILE
MATCH (s:Station), (u:User_group), (us:User_group_station)
WHERE s.id = us.id_station AND us.id_user_group = u.id  
WITH s, u, us
RETURN s.id, s.name, s.id_station_type, u.id, u.name

Cypher version: , planner: COST, runtime: PIPELINED. 54785 total db hits in 84 ms.
