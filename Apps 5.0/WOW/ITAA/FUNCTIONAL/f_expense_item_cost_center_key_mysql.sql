SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset_status_history.cost_center_key' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.alm_asset_final SRC 
LEFT JOIN wow_mdwdb.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.asset_key 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN wow_mdsdb.sys_user_final LKP 
 ON SRC.owned_by= LKP.sys_id 
AND SRC.sourceinstance = LKP.sourceinstance 
LEFT JOIN wow_mdwdb.d_cost_center LKP1
on  COALESCE( SRC.cost_center,LKP.cost_center,'UNSPECIFIED') =LKP1.row_id
 WHERE COALESCE(LKP1.row_key,CASE WHEN COALESCE( SRC.cost_center,LKP.cost_center) IS NULL THEN 0 else '-1' end)<> TRGT.cost_center_key