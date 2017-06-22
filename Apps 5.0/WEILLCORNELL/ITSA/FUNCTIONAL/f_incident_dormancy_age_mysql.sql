SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message from (select SRC.sys_id ,TRGT.row_id,TRGT.row_key,COALESCE(TIMESTAMPDIFF(SECOND,CONVERT_TZ(SRC.sys_updated_on,'GMT','America/New_York'),((SELECT MAX(lastupdated) AS lastupdated
FROM weillcornell_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=TRGT.etl_run_number))),0), TRGT.dormancy_age,COALESCE(TIMESTAMPDIFF(SECOND,CONVERT_TZ(SRC.sys_updated_on,'GMT','America/New_York'),((SELECT MAX(lastupdated) AS lastupdated
FROM weillcornell_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=TRGT.etl_run_number))),0)- TRGT.dormancy_age as difference
FROM weillcornell_mdsdb.incident_final SRC 
JOIN weillcornell_mdwdb.f_incident TRGT 
	ON SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id
JOIN weillcornell_mdwdb.d_lov_map lm ON lm.src_key = TRGT.state_src_key
WHERE lm.dimension_class = 'STATE~INCIDENT' AND  lm.dimension_wh_code = 'OPEN'  
AND COALESCE(TIMESTAMPDIFF(SECOND,CONVERT_TZ(SRC.sys_updated_on,'GMT','America/New_York'),((SELECT MAX(lastupdated) AS lastupdated
FROM weillcornell_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=TRGT.etl_run_number))),0)<> TRGT.dormancy_age )b
