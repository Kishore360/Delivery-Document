SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.loaner_expiration_date_c' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_asset TRGT 
 ON (SRC.sys_id=right(TRGT.row_id,32)
 AND SRC.sourceinstance=TRGT.source_id )
where COALESCE(convert_tz(SRC.u_loaner_expiration_date,'GMT','America/Los_Angeles'),'%Y%m%d') <> TRGT.loaner_expiration_date_c;