 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message from (
 select count(1) cnt  
  FROM 
#DWH_TABLE_SCHEMA.d_incident di
  JOIN #DWH_TABLE_SCHEMA.f_incident fi ON di.row_key = fi.incident_key
  JOIN #DWH_TABLE_SCHEMA.d_lov_map dlm ON fi.state_src_key = dlm.src_key  	
  where dlm.dimension_class = 'STATE~INCIDENT'
  AND dlm.dimension_wh_code = 'OPEN'
  AND  (CASE WHEN timestampdiff(DAY,di.changed_on, (SELECT MAX(lastupdated) AS lastupdated
FROM #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE sourcename like 'ServiceNow%' and etl_run_number=fi.etl_run_number))>30 
THEN 'Y' ELSE 'N' END) <> di.dormant_flag)a;