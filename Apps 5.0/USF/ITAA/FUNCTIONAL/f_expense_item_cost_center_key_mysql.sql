
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.cost_center_key' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.alm_asset_final SRC 
 LEFT JOIN usf_mdwdb.f_expense TRGT 
on (convert(CONCAT(SRC.sys_id,'~',DATE_FORMAT(SRC.sys_created_on,'%Y%m%d%H%i%S') ) ) =convert(TRGT.row_id )
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN usf_mdwdb.d_cost_center LKP 
 ON ( CONVERT(SRC.cost_center )= convert(LKP.row_id )
AND CONVERT(SRC.sourceinstance )= convert(LKP.source_id ))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cost_center IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.cost_center_key,'')
