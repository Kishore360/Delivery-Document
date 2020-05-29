SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.total_spend_loc_amount' ELSE 'SUCCESS' END as Message
FROM  
(select SRC.sys_id,SRC.sourceinstance,cast(coalesce(sum(cur.amount),0)as decimal(20,10)) as total_spend_loc_amount 
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.alm_asset_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN 
( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') header 
ON SRC.sys_id = header.asset
and SRC.sourceinstance=header.sourceinstance
JOIN ( select * from #MDS_TABLE_SCHEMA.fx_currency_instance_final where (id, sys_created_on,field) in ( select id, max(sys_created_on),field from #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D' and field='amount' and (id is not null) group by id, sys_created_on,field)) cur 
on cur.id=header.sys_id and cur.field='amount'
WHERE header.asset is not null
group by  SRC.sys_id,SRC.sourceinstance
)SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_asset TRGT 
 ON (SRC.sys_id=TRGT.row_id 
  AND SRC.sourceinstance=TRGT.source_id ) 
  where coalesce(SRC.total_spend_loc_amount ,'')<>coalesce(TRGT.total_spend_loc_amount ,'')
;
