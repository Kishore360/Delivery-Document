SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
FROM equifax_mdsdb.task_ci_final f1
left  join equifax_mdsdb.incident_final f2
on f1.task=f2.sys_id and f1.sourceinstance=f2.sourceinstance
left join equifax_mdsdb.change_request_final f3
on f1.task=f3.sys_id and f1.sourceinstance=f3.sourceinstance
left join equifax_mdsdb.sc_request_final f4
on f1.task=f4.sys_id and f1.sourceinstance=f4.sourceinstance
left join equifax_mdsdb.problem_final f5
on f1.task=f5.sys_id and f1.sourceinstance=f5.sourceinstance
 left join equifax_mdsdb.sc_req_item_final f6
on f1.task=f6.sys_id and f1.sourceinstance=f6.sourceinstance
left join  equifax_mdsdb.sc_task_final f7
on f1.task=f7.sys_id and f1.sourceinstance=f7.sourceinstance
JOIN equifax_mdwdb.d_task_ci_c TRGT 
ON f1.sys_id = TRGT.row_id 
and  f1.sourceinstance = TRGT.source_id  
WHERE CONVERT_TZ (COALESCE( coalesce(f2.opened_at,f2.sys_created_on),coalesce(f3.opened_at,f3.sys_created_on),coalesce(f4.opened_at,f4.sys_created_on),coalesce(f5.opened_at,f5.sys_created_on),coalesce(f6.opened_at,f6.sys_created_on),coalesce(f7.opened_at,f7.sys_created_on)),'GMT','America/New_York')  <> TRGT.opened_at_c and f1.cdctype<>'D')b