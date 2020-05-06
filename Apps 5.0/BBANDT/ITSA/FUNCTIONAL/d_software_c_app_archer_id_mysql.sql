SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT  > 0 THEN 'MDS to DWH data validation failed for d_software_c.app_archer_id' ELSE 'SUCCESS' END as Message
 FROM (SELECT Count(1) as CNT 
 FROM bbandt_mdsdb.cmdb_ci_spkg_final SRC 
 LEFT JOIN bbandt_mdwdb.d_software_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  CASE WHEN SRC.u_archer_id like 'app%' THEN SRC.u_archer_id   
ELSE CONCAT('APPID-',SRC.u_archer_id) END<> TRGT.app_archer_id 
 and SRC.CDCTYPE<>'D'
 ) temp; 