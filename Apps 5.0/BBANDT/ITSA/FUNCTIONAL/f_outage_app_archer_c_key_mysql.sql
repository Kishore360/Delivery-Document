select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_outage.app_archer_c_key'  ELSE 'SUCCESS'  END as Message
--  select distinct SRC.number,COALESCE(SRC.cmdb_ci,'UNSPECIFIED'),COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 ELSE -1 END) erow,
-- LKP.row_id ,LKP.dw_updated_on,TRGT.dw_updated_on,TRGT.app_archer_c_key
FROM bbandt_mdsdb.cmdb_ci_outage_final SRC 
JOIN bbandt_mdwdb.f_outage TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN bbandt_mdwdb.d_app_archer_c LKP 
ON COALESCE(SRC.cmdb_ci,'UNSPECIFIED')=LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 ELSE -1 END)<>TRGT.app_archer_c_key
and SRC.cdctype='X' ;