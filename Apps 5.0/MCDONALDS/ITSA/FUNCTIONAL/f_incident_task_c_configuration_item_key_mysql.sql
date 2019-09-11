SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_task_c.configuration_item_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.f_incident_task_c trgt
RIGHT JOIN (SELECT *,COALESCE(src.cmdb_ci,'UNSPECIFIED') as jn1 FROM mcdonalds_mdsdb.incident_task_final src) src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_configuration_item lkp ON  src.jn1= lkp.row_id and src.sourceinstance = lkp.source_id

WHERE COALESCE(lkp.row_key,CASE WHEN src.cmdb_ci IS NULL THEN 0 else -1 end) <> trgt.configuration_item_key
;