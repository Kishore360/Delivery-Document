SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdsdb.sys_audit_final  SRC
JOIN mercuryins_mdwdb.f_catalog_audit_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.tablename in ('sc_cat_item','item_option_new')
join
mercuryins_mdwdb.d_calendar_time LKP
on COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.sys_created_on,'GMT','America/Los_Angeles'),'%H%i'),'UNSPECIFIED')= LKP.row_id 
WHERE coalesce(LKP.row_key,case when SRC.sys_created_on is  null then 0 else -1 end )<>(TRGT.created_time_key) 

	