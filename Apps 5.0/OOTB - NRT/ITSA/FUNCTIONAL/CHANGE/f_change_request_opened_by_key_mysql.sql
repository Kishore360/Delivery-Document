 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM (select * from <<tenant>>_mdsdb.change_request_final where cdctype<>'D') SRC
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',opened_by)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND COALESCE(CONVERT_TZ (SRC.opened_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>), CONVERT_TZ (coalesce(SRC.closed_at,SRC.sys_updated_on),<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)) 
BETWEEN LKP.effective_from AND LKP.effective_to ) 
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (TRGT.opened_by_key))temp;