//item query
PROFILE
MATCH (i:Item), (it:Item_type)
WHERE i.id_item_type = it.id 
WITH i, it
SKIP 0
LIMIT 1000000
RETURN i.id as id, i.comment as comment, it.name as item_name