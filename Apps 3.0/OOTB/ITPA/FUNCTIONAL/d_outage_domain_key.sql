

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage.domain_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN <<tenant>>_mdsdb.cmdb_ci_final SRC2
 ON(SRC.cmdb_ci  =SRC2.sys_id  
 AND SRC.sourceinstance = SRC2.sourceinstance )
 LEFT JOIN <<tenant>>_mdwdb.d_outage TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN <<tenant>>_mdwdb.d_domain LKP 
 ON ( SRC2.sys_domain = LKP.row_id 
AND SRC2.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC2.sys_domain IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.domain_key,'')
