SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.lkp_region_c_key' ELSE 'SUCCESS' END as Message
 FROM wpl_mdsdb.alm_asset_final SRC 
 LEFT JOIN wpl_mdwdb.f_asset TRGT 
 on SRC.sys_id =TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id 
 JOIN wpl_mdwdb.d_lov LKP
 ON (COALESCE(CONCAT('LKP_REGION_C~ASSET~',SRC.u_region_ref),'UNSPECIFIED'))= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id 
 
  -- AND DATE_FORMAT(TRGT.status_start_on, '%Y-%m-%d %H:%i:%s') BETWEEN effective_from AND effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_region_ref IS NULL THEN 0 else '-1' end)<>COALESCE(TRGT.lkp_region_c_key,'')
 and SRC.cdctype<>'D' ;