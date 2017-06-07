SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.is_loaner_flag_c' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_asset TRGT 
 ON (SRC.sys_id=right(TRGT.row_id,32)
 AND SRC.sourceinstance=TRGT.source_id )
where case when SRC.u_is_loaner =1 then 'Y' else 'N' end<> TRGT.is_loaner_flag_c;