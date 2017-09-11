SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_asset TRGT 
 ON ( CONCAT('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id) 
  WHERE (CASE WHEN SRC.u_not_eligible= 1 then 'Y' else 'N' END)<> TRGT.is_not_eligible_for_rp_c)t;
