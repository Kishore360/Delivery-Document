SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_asset.asset_assigned_to_key' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.v_r_system_final SRC JOIN schneider_mdwdb.d_asset TRGT 
ON SRC.resourceid   = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
join schneider_mdwdb.d_lov lkp  on  lkp.row_id = COALESCE(SRC.user_name0,'UNSPECIFIED') 
 WHERE COALESCE(lkp.row_key, case when SRC.user_name0 is null then 0 else  -1 end ) > (TRGT.asset_assigned_to_key) 
