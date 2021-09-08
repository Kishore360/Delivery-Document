SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_task_c.closed_by_key' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.f_incident_task_c trgt
RIGHT JOIN mcd_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcd_mdwdb.d_lov_map lv_mp ON COALESCE(CONCAT('STATE~INCIDENT_TASK~~~',src.state),'UNSPECIFIED') = lv_mp.src_rowid AND lv_mp.dimension_wh_code ='CLOSED'
LEFT JOIN mcd_mdwdb.d_internal_contact ic_cl ON COALESCE(CONCAT('INTERNAL_CONTACT~',src.closed_by))= ic_cl.row_id
LEFT JOIN mcd_mdwdb.d_internal_contact ic ON src.sys_updated_by = ic.user_name
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where trgt.soft_deleted_flag='N' and  (src.cdctime<=f1.lastupdated) 
and IF(src.closed_by is NULL ,ic.row_key,ic_cl.row_key) <> trgt.closed_by_key
;