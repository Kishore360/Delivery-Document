SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.manager_c_key' ELSE 'SUCCESS' END as Message 
  from intuit_mdsdb.sys_user_final b
left join intuit_mdwdb.d_internal_contact a
ON a.row_id = concat('INTERNAL_CONTACT~',b.sys_id ) AND a.source_id = b.sourceinstance 
left join intuit_mdwdb.d_internal_contact c
on   c.row_id = concat('INTERNAL_CONTACT~',b.manager) AND c.source_id = b.sourceinstance 

where a.manager_c_key  <>	CASE 
							WHEN manager is null  THEN 0 
							ELSE COALESCE(c.row_key, -1) END; 
