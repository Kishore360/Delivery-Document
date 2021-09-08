SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_task_c.service_impact_comm_publication_src_c_key' ELSE 'SUCCESS' END as Message 

FROM mcd_mdwdb.d_incident_task_c trgt
RIGHT JOIN mcd_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcd_mdwdb.d_lov lkp
ON COALESCE(CONCAT('SERVICE_IMPACT_C~INCIDENT_TASK~~~',src.u_service_impact_comm_publication),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where  COALESCE(lkp.row_key,CASE WHEN src.u_service_impact_comm_publication IS NULL THEN 0 else -1 end) <> trgt.service_impact_comm_publication_src_c_key
;