SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.install_on' ELSE 'SUCCESS' END as Message
  FROM whirlpool_mdsdb.alm_asset_final SRC 
 LEFT JOIN whirlpool_mdwdb.f_n_asset_weekly TRGT 
on TRGT.row_id=SRC.sys_id and TRGT.source_id=SRC.sourceinstance
 WHERE coalesce(SRC.serial_number,'UNSPECIFIED')<> TRGT.serial_number_c
 and SRC.cdctype='X'

