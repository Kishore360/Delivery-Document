SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.incident_final SRC

JOIN mercury_mdwdb.d_incident TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
JOIN mercury_mdwdb.d_lov_map br ON TRGT.state_src_key = br.src_key
AND br.dimension_wh_code  in  ('CLOSED','RESOLVED') and br.dimension_class = 'STATE~INCIDENT'
WHERE 
CASE 
WHEN timestampdiff(MINUTE,TRGT.opened_on,
(SELECT MAX(lastupdated) AS lastupdated
FROM mercury_mdwdb.d_o_data_freshness
where TRGT.source_id=d_o_data_freshness.source_id ) )
< 30 THEN 'P' ELSE 'N' end <> TRGT.first_call_resolution_flag


