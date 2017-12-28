SELECT CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message  
 FROM pan_mdwdb.d_incident_tasks_c TRGT 
    JOIN  pan_mdwdb.f_incident_tasks_c TRGTF 
 ON (TRGTF.incident_tasks_c_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN pan_mdwdb.d_lov_map LM
 on TRGT.state_src_key = LM.src_key 
WHERE TRGT.soft_deleted_flag='N' and  LM.dimension_class = 'STATE~TASK' and 
( CASE WHEN LM.dimension_wh_code NOT IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END)<> (TRGT.backlog_flag)

