SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.outage_type_src_key' ELSE 'SUCCESS' END as Message 
 from  discover_mdsdb.cmdb_ci_outage_final  SRC JOIN discover_mdwdb.d_outage TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
  LEFT JOIN discover_mdwdb.d_lov LKP ON ( concat( 'TYPE~OUTAGE~' ,upper( SRC.type)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id )
  WHERE COALESCE(LKP.row_key,CASE WHEN SRC.type IS NULL THEN 0 else -1 end)<>(TRGT.outage_type_src_key) and SRC.cdctype='X'
