
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.managed_by' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.cmdb_ci_appl_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_application TRGT 
 ON (concat('APPLICATION~', SRC.sys_id)  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.managed_by ,'')<> COALESCE(TRGT.managed_by ,'') and SRC.cdctype='X'
