SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_change_request.region_c_key' ELSE 'SUCCESS' END as Message from(
  SELECT count(1) as cnt 
  FROM whirlpool_mdsdb.change_request_final SRC 
  JOIN whirlpool_mdwdb.f_change_request TRGT 
  ON (SRC.sys_id =TRGT.row_id 
  AND SRC.sourceinstance= TRGT.source_id )
  JOIN whirlpool_mdwdb.d_lov LKP 
  ON ( COALESCE(concat('LKP_REGION_C~CHANGE_REQUEST~~~',upper(u_lkp_region),'UNSPECIFIED'))= LKP.src_rowid 
 AND SRC.sourceinstance= LKP.source_id )
  WHERE COALESCE(LKP.row_key,CASE WHEN u_lkp_region is null THEN 0 else -1 end) <> (TRGT.region_c_key)
and SRC.CDCTYPE='X')x