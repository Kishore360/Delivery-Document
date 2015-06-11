


SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,CASE WHEN COUNT(1) > 0 THEN 'Multiple records exists for row_id,source_id,effective_from,level ' ELSE 'Unique records exists for row_id,source_id,effective_from,level ' END AS Message
FROM (SELECT COUNT(1),row_id,source_id,effective_from,level FROM dh_hierarchy_security
GROUP BY row_id,source_id,effective_from,level
HAVING COUNT(1)>1) R
