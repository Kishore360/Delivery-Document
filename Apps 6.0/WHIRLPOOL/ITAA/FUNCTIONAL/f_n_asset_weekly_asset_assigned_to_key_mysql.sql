SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.install_on' ELSE 'SUCCESS' END as Message
  FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_n_asset_weekly TRGT 
on TRGT.row_id=SRC.sys_id and TRGT.source_id=SRC.sourceinstance
join whirlpool_mdwdb.d_internal_contact LKP
on COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.assigned_to),'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.source_id
 WHERE coalesce(LKP.row_key,case when SRC.assigned_to is null then 0 else -1 end)<>TRGT.asset_assigned_to_key
 and SRC.cdctype='X'