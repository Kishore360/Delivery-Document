
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.domain_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.cmdb_ci_appl_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_application TRGT 
 ON (convert(concat('APPLICATION~', SRC.sys_id) using utf8) =convert(TRGT.row_id using utf8) 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN whirlpool_.d_domain LKP 
 ON ( CONVERT(SRC.dns_domain using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.dns_domain IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.domain_key,'')
