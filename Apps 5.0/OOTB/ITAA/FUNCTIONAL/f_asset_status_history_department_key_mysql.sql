SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.department_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.alm_asset_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_asset_status_history TRGT 
 ON (SRC.sys_id=TRGT.asset_key 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN <<tenant>>_mdsdb.sys_user_final LKP 
 ON SRC.owned_by= LKP.sys_id 
AND SRC.sourceinstance = LKP.sourceinstance 
LEFT JOIN <<tenant>>_mdwdb.d_internal_organization LKP1
on LKP1.row_id=COALESCE(CONCAT('DEPARTMENT~',LKP.department),CONCAT('DEPARTMENT~',SRC.department),'UNSPECIFIED')
 WHERE COALESCE(LKP1.row_key,CASE WHEN COALESCE(SRC.department, LKP.department)IS NULL then 0 else '-1' end)<> TRGT.department_key