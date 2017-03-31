SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM usf_mdsdb.alm_asset_final SRC 
 LEFT JOIN usf_mdwdb.d_asset TRGT 
 ON ( CONCAT('ASSET~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id) 
  WHERE 'N'<> TRGT.eligible_for_rp_cy_c_flag)t;
