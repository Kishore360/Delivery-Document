select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_problem.archer_id_c_key'  ELSE 'SUCCESS'  END as Message
--  select distinct SRC.number,COALESCE(SRC.cmdb_ci,'UNSPECIFIED'),COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 ELSE -1 END) erow,
-- LKP.row_id ,LKP.dw_updated_on,TRGT.dw_updated_on,TRGT.archer_id_c_key
FROM bbandt_mdsdb.problem_final SRC 
JOIN bbandt_mdwdb.f_problem TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN bbandt_mdwdb.d_software_c LKP 
ON COALESCE(SRC.cmdb_ci,'UNSPECIFIED')=LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 ELSE -1 END)<>TRGT.archer_id_c_key ;