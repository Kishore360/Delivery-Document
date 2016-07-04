SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task.opened_by_department_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.task_final SRC_P
LEFT JOIN <<tenant>>_mdsdb.sys_user_final SRC
ON (SRC.sys_id=SRC_P.opened_by) 
LEFT JOIN <<tenant>>_mdwdb.f_task TRGT 
	ON (SRC_P.sys_id =TRGT.row_id 
	AND SRC_P.sourceinstance =TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_internal_organization LKP 
	ON (CONCAT('DEPARTMENT~',SRC.department) = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.department IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.opened_by_department_key ,'')
;
