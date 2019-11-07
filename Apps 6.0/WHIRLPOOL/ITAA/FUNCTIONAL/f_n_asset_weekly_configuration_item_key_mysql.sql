SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.install_on' ELSE 'SUCCESS' END as Message
  FROM whirlpool_mdsdb.alm_asset_final SRC 
  JOIN whirlpool_mdwdb.f_n_asset_weekly TRGT 
on TRGT.row_id=SRC.sys_id and TRGT.source_id=SRC.sourceinstance
LEFT join whirlpool_mdwdb.d_configuration_item LKP
on COALESCE(SRC.ci,'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.source_id
 WHERE coalesce(LKP.row_key,case when SRC.ci is null then 0 else -1 end)<>TRGT.configuration_item_key
 and SRC.cdctype='X'

