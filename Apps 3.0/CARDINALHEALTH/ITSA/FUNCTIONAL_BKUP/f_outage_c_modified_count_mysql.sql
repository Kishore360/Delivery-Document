 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_outage_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where  SRC.sys_mod_count<> TRGT.modified_count)temp;








