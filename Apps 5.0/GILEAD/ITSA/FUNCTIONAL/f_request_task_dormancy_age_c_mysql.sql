  SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_task_fss_c.dormant_flag' ELSE 'SUCCESS' END as Message from (
 select count(1) as cnt 
  FROM 
  gilead_mdwdb.d_request_task di
 JOIN 
gilead_mdwdb.f_request_task fi ON di.row_key = fi.request_task_key AND fi.source_id=di.source_id
  JOIN gilead_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key  	
  where dlm.dimension_class = 'STATE~SC_TASK'
  AND dlm.dimension_wh_code = 'OPEN'
  AND  ( timestampdiff(second, CONVERT_TZ(di.changed_on,'America/New_York','GMT'), CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM gilead_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),'America/New_York','GMT'))) <> fi.dormancy_age_c)a; 


