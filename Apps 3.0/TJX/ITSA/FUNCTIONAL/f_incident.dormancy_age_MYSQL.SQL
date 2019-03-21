select 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message
 FROM 
 (select count(1) cnt from 
 (SELECT SRC.sys_updated_on,TRGT.dormancy_age dormancy_age,
COALESCE(TIMESTAMPDIFF(second,SRC.sys_updated_on,CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM tjx_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'
and etl_run_number=TRGT.etl_run_number),'GMT','America/New_York')),0)abc
 FROM tjx_mdsdb.incident_final SRC 
join  tjx_mdwdb.f_incident TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id )
  left join tjx_mdwdb.d_lov_map lm ON (lm.src_key = TRGT.state_src_key)
 where TRGT.soft_deleted_flag<>'Y' and lm.dimension_class = 'STATE~INCIDENT'
AND  lm.dimension_wh_code = 'OPEN'  )abc
where abc.abc<> dormancy_age  )temp;