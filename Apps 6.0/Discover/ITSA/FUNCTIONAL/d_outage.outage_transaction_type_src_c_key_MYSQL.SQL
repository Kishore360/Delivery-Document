SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.outage_transaction_type_src_c_key' ELSE 'SUCCESS' END as Message 
FROM discover_mdsdb.cmdb_ci_outage_final  SRC JOIN discover_mdwdb.d_outage TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN discover_mdwdb.d_lov LKP ON ( concat( 'TRANSACTION_TYPE_C~OUTAGE~' ,upper( SRC.u_transaction_type)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_transaction_type IS NULL THEN 0 else -1 end)<> (TRGT.outage_transaction_type_src_c_key) and SRC.cdctype='X'