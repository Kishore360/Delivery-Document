SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT  > 0 THEN 'MDS to DWH data validation failed for d_software_c.archer_id' ELSE 'SUCCESS' END as Message
 FROM (SELECT Count(1) as CNT 
 FROM truist_mdsdb.cmdb_ci_spkg_final SRC 
 LEFT JOIN truist_mdwdb.d_software_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.u_archer_id,'')<> TRGT.archer_id 
 and SRC.CDCTYPE<>'D'
 ) temp; 
