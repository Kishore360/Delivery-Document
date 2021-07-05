 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_task_fss_c.dormant_flag' ELSE 'SUCCESS' END as Message from (
 select count(1) as cnt 
  FROM (
 select di.request_task_number,( timestampdiff(second,di.opened_on, (SELECT MAX(lastupdated) AS lastupdated
FROM mcd_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')))/86400 , fi.age/86400
  FROM 
  mcd_mdwdb.d_request_task di
 JOIN 
mcd_mdwdb.f_request_task fi ON di.row_key = fi.request_task_key AND fi.source_id=di.source_id
  JOIN mcd_mdwdb.d_lov_map dlm ON fi.state_src_key = dlm.src_key  	
  where dlm.dimension_class = 'STATE~SC_TASK'
  AND dlm.dimension_wh_code = 'OPEN'
  AND  ( timestampdiff(second,di.opened_on, (SELECT MAX(lastupdated) AS lastupdated
FROM mcd_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%')))/86400 <> fi.age/86400)a)b; 