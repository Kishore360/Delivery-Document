SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.support_group_c_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_asset_status_history TRGT 
 on (CONCAT(SRC.sys_id,'~',DATE_FORMAT(SRC.sys_created_on,'%Y%m%d%H%i%S') )  =right(TRGT.row_id,32)
 AND SRC.sourceinstance=TRGT.source_id )
JOIN whirlpool_mdwdb.d_internal_organization LKP 
  ON (COALESCE(CONCAT('GROUP~',SRC.support_group),'UNSPECIFIED'))= LKP.row_id
  AND DATE_FORMAT(TRGT.status_start_on, '%Y-%m-%d %H:%i:%s') 
									BETWEEN effective_from AND effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.support_group IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.support_group_c_key,'')
 and SRC.cdctype<>'D' 