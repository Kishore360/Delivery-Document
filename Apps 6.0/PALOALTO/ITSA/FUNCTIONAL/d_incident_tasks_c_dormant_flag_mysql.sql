SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM
pan6_mdwdb.d_incident_tasks_c di
  JOIN pan6_mdwdb.f_incident_tasks_c fi ON di.row_key = fi.incident_tasks_c_key
  LEFT JOIN pan6_mdwdb.d_lov_map dlm ON di.state_src_key = dlm.src_key  	
  where dlm.dimension_class = 'STATE~INCIDENT_TASKS'
  AND dlm.dimension_wh_code = 'OPEN'
  AND  (CASE WHEN timestampdiff(DAY,di.changed_on, (SELECT MAX(lastupdated) AS lastupdated
FROM pan6_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=fi.etl_run_number))>30 
THEN 'Y' ELSE 'N' END) <> di.dormant_flag