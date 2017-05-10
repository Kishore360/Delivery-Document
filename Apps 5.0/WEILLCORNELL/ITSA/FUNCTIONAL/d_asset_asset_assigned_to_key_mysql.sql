SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_asset.asset_assigned_to_key' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_asset trgt
RIGHT JOIN wow_mdsdb.alm_asset_final src
on CONCAT('ASSET~',src.sys_id) = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN wow_mdwdb.d_internal_contact lkp
ON COALESCE(CONCAT('INTERNAL_CONTACT~',src.assigned_to),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.assigned_to IS NULL THEN 0 else -1 end)<> trgt.asset_assigned_to_key
;