select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_problem.application_archer_c_key'  ELSE 'SUCCESS'  END as Message
-- select distinct SRC.sys_id,TRGT.row_id,COALESCE(UPPER(CONCAT('APPID-',REPLACE(UPPER(SRC1.u_archer_id),'APPID-',''))),'UNSPECIFIED') erow,
-- LKP.row_id,COALESCE(LKP.row_key,CASE WHEN SRC1.u_archer_id IS NULL THEN 0 ELSE -1 END) ,TRGT.application_archer_c_key
FROM truist_mdsdb.problem_final SRC 
JOIN truist_mdwdb.f_problem
 TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN truist_mdsdb.cmdb_ci_spkg_final SRC1
on SRC.cmdb_ci=SRC1.sys_id and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN truist_mdwdb.d_archer_application_c LKP 
ON COALESCE(CONCAT('APPID-',REPLACE(UPPER(SRC1.u_archer_id),'APPID-','')),'UNSPECIFIED')=LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.u_archer_id IS NULL THEN 0 ELSE -1 END)<>TRGT.application_archer_c_key ;