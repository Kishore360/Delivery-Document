SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for f_problem_task.opened_by_department_key' ELSE 'SUCCESS' END as Message
FROM ingrammicro_mdsdb.u_problem_task_final SRC
JOIN ingrammicro_mdwdb.f_problem_task TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.CDCTYPE<>'D'
JOIN ingrammicro_mdsdb.sys_user_final SRC1 ON SRC.opened_by=SRC1.sys_id and SRC.sourceinstance=SRC1.sourceinstance
JOIN (select right(row_id,32) as row_id,source_id,department_key from ingrammicro_mdwdb.d_internal_contact) LKP ON LKP.row_id=SRC1.sys_id AND SRC1.sourceinstance=LKP.source_id
WHERE LKP.department_key<>TRGT.opened_by_department_key ;