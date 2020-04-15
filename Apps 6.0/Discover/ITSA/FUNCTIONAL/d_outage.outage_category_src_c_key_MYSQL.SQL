SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.outage_category_src_c_key' ELSE 'SUCCESS' END as Message 
 from discover_mdsdb.cmdb_ci_outage_final  SRC JOIN discover_mdwdb.d_outage TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
  LEFT JOIN discover_mdwdb.d_lov LKP ON ( concat( 'CATEGORY_C~OUTAGE~' ,upper( SRC.u_outage_category)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id )
  WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_outage_category IS NULL THEN 0 else -1 end)<>(TRGT.outage_category_src_c_key) and SRC.cdctype='X'
