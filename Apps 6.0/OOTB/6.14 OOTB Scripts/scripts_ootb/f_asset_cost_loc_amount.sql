
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.cost_loc_amount' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.alm_asset_final WHERE CDCTYPE<>'D') SRC 
left join ( select * from #MDS_TABLE_SCHEMA.fx_currency_instance_final where (id, sys_created_on,field) in ( select id, max(sys_created_on),field from #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D' and field='cost' and (id is not null) group by id, sys_created_on,field)) cst 
on cst.id=SRC.sys_id and cst.field='cost'
 and cst.field='cost'
 LEFT JOIN #DWH_TABLE_SCHEMA.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  WHERE cast(coalesce(cst.amount,0)as decimal(20,10))<> COALESCE(TRGT.cost_loc_amount ,'')
 

