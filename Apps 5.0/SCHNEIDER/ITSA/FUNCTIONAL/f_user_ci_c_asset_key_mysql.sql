SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_user_ci_c.asset_key' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.v_gs_installed_software_final SRC JOIN schneider_mdwdb.f_user_ci_c TRGT
ON CONCAT(SRC.resourceid,'~',SRC.groupid)  = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
join schneider_mdwdb.d_asset lkp on COALESCE(SRC.resourceid,'UNSPECIFIED') = lkp.row_id
 WHERE COALESCE(lkp.row_key , case when SRC.resourceid is null then 0 else  -1 end) <> (TRGT.asset_key) 
