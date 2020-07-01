select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_change_request.app_archer_c_key'  ELSE 'SUCCESS'  END as Message
--  select distinct SRC.number,COALESCE(SRC.cmdb_ci,'UNSPECIFIED'),COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 ELSE -1 END) erow,
-- LKP.row_id ,LKP.dw_updated_on,TRGT.dw_updated_on,TRGT.app_archer_c_key
FROM truist_mdsdb.change_request_final SRC 
JOIN truist_mdwdb.f_change_request TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN truist_mdwdb.d_app_archer_c LKP 
ON COALESCE(SRC.cmdb_ci,'UNSPECIFIED')=LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 ELSE -1 END)<>TRGT.app_archer_c_key ;