
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_task_fss_c.dormant_flag' ELSE 'SUCCESS' END as Message from (
 select count(1) as cnt 
  FROM 
  gilead_mdwdb.d_task_fss_c di
 JOIN 
gilead_mdwdb.f_task_fss_c fi ON di.row_key = fi.task_fss_c_key AND fi.source_id=di.source_id
  JOIN gilead_mdwdb.d_lov_map dlm ON di.state_c_key = dlm.src_key  	
  where dlm.dimension_class = 'STATE_C~TASK_FSS_C'
  AND dlm.dimension_wh_code = 'OPEN'
  AND  ( timestampdiff(second,di.opened_on, (SELECT MAX(lastupdated) AS lastupdated
FROM gilead_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))) <> fi.age)a; 