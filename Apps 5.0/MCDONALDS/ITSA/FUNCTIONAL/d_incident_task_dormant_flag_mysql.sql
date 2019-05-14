SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_task.dormant_flag' ELSE 'SUCCESS' END as Message
   FROM mcdonalds_mdsdb.incident_task_final SRC 
  LEFT JOIN mcdonalds_mdwdb.d_incident_task_c TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
   JOIN mcdonalds_mdwdb.d_lov_map dlm ON TRGT.state_src_key = dlm.src_key
    AND dlm.dimension_class = 'STATE~INCIDENT_TASK'
  AND dlm.dimension_wh_code = 'OPEN'
  LEFT JOIN (
 select source_id,MAX(lastupdated) lastupdated from  mcdonalds_mdwdb.d_o_data_freshness
 group by 1
 
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance
 
 )

 WHERE case when (timestampdiff(DAY,CONVERT_TZ(SRC.sys_updated_on,'US/Central','GMT'), FRESH.lastupdated) >30) 
   then 'Y' END  <> TRGT.dormant_flag ;