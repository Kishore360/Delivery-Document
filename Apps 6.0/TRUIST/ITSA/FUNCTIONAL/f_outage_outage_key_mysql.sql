
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage.outage_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM truist_mdsdb.cmdb_ci_outage_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN truist_mdwdb.f_outage TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN truist_mdwdb.d_outage LKP 
 ON ( SRC.sys_id = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.outage_key,'')
