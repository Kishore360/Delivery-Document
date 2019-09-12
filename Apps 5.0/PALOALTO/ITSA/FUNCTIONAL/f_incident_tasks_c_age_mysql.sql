

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_sr_task_c_created_by' ELSE 'SUCCESS' END as Message 
FROM 
(
select  count(1) cnt 
FROM pan_mdsdb.u_incident_tasks_final SRC 
  join  pan_mdwdb.f_incident_tasks_c f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id  )
JOIN  pan_mdwdb.d_incident_tasks_c a ON a.row_key = f.incident_tasks_c_key
AND f.source_id = a.source_id
JOIN pan_mdwdb.d_lov_map br ON a.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN'
WHERE
 timestampdiff(second,a.opened_on,(SELECT MAX(la.lastupdated) AS lastupdated
FROM pan_mdwdb.d_o_data_freshness la WHERE  la.sourcename like 'ServiceNow%'))<> f.age)temp;


