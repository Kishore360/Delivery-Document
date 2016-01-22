
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.cmdb_ci_computer_final SRC
LEFT JOIN svb_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%OS~CMDB_CI_COMPUTER%' and 
( concat('OS~CMDB_CI_COMPUTER~~~',upper(os))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN svb_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.os IS NULL THEN 0 else -1 end)<> (TRGT.os_c_key)