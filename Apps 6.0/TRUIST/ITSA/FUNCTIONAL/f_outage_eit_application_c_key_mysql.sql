select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_outage.application_archer_c_key'  ELSE 'SUCCESS'  END as Message
-- select distinct SRC.sys_id,TRGT.row_id,COALESCE(UPPER(CONCAT('APPID-',REPLACE(UPPER(SRC1.u_archer_id),'APPID-',''))),'UNSPECIFIED') erow,
-- LKP.row_id,COALESCE(LKP.row_key,CASE WHEN SRC1.u_archer_id IS NULL THEN 0 ELSE -1 END) ,TRGT.application_archer_c_key
FROM truist_mdsdb.cmdb_ci_outage_final SRC 
JOIN truist_mdwdb.f_outage TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN truist_mdsdb.cmdb_ci_spkg_final SRC1
on SRC.cmdb_ci=SRC1.sys_id and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN truist_mdwdb.d_eit_application_c LKP 
ON case when SRC.cmdb_ci is NULL  or SRC1.u_archer_id is NULL  then   'UNSPECIFIED'   else  SRC1.u_archer_id  end=LKP.row_id 
WHERE COALESCE(LKP.row_key,CASE WHEN coalesce(SRC.cmdb_ci,SRC1.u_archer_id) IS NULL THEN 0 ELSE -1 END)<>TRGT.eit_application_c_key
and SRC.cdctype<>'D' AND DATE_FORMAT(TRGT.pivot_date, '%Y-%m-%d %H:%i:%s') BETWEEN effective_from AND effective_to;