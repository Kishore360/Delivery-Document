
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.department_key' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.alm_asset SRC 
 LEFT JOIN usf_mdwdb.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN usf_mdwdb.d_internal_organization LKP 
 ON ( CONVERT(CONCAT('DEPARTMENT~',SRC.department) )= convert(LKP.row_id )
AND CONVERT(SRC.sourceinstance )= convert(LKP.source_id ))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.department IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.department_key,'')
