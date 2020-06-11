SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.loc_currency_code' ELSE 'SUCCESS' END as Message
  

FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.alm_asset_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN 
( select * from #MDS_TABLE_SCHEMA.fx_currency_instance_final where (id, sys_created_on,field) in ( select id, max(sys_created_on),field from #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D' and field='cost' and (id is not null) group by id, sys_created_on,field)) cst 
on cst.id=SRC.sys_id
and SRC.sourceinstance=cst.sourceinstance
 and cst.field='cost'

 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset TRGT 
 ON ( concat('ASSET~',SRC.sys_id)=TRGT.row_id 
  AND SRC.sourceinstance=TRGT.source_id ) 
  where coalesce(cst.currency ,'')<>coalesce(TRGT.loc_currency_code ,'')
;
