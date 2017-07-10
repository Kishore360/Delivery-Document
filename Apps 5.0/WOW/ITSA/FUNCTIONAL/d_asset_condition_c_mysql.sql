SELECT CASE WHEN count(1) > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message  from wow_mdwdb.d_asset trgt
 JOIN wow_mdsdb.alm_asset_final src 
ON trgt.source_id = src.sourceinstance AND trgt.row_id = CONCAT('ASSET~',src.sys_id)
where trgt.condition_c <> src.u_condition;

