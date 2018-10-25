SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_task_c.closed_by_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.f_incident_task_c trgt
RIGHT JOIN mcdonalds_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_lov_map lv_mp ON COALESCE(CONCAT('STATE~INCIDENT_TASK~~~',src.state),'UNSPECIFIED') = lv_mp.src_rowid AND lv_mp.dimension_wh_code ='CLOSED'
LEFT JOIN mcdonalds_mdwdb.d_internal_contact ic_cl ON COALESCE(CONCAT('INTERNAL_CONTACT~',src.closed_by))= ic_cl.row_id
LEFT JOIN mcdonalds_mdwdb.d_internal_contact ic ON src.sys_updated_by = ic.user_name
WHERE IF(src.closed_by is NULL ,ic.row_key,ic_cl.row_key) <> trgt.closed_by_key
;