SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
 FROM  svb_mdsdb.sys_user_group_final a
JOIN  svb_mdwdb.d_internal_organization f 
ON concat('GROUP~',a.sys_id) = f.row_id and a.sourceinstance=f.source_id
where 
CONVERT_TZ(a.sys_created_on,'GMT','America/Los_Angeles')<>f.pivot_date
)b
