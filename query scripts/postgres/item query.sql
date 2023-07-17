
EXPLAIN ANALYZE
SELECT it.id,
i.id_item_type,
i.comment,
it.name
FROM item as i, item_type as it
WHERE it.id = i.id_item_type
GROUP BY it.id, i.id_item_type, i.comment, it.name