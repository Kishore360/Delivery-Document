SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.expense_loc_amount' ELSE 'SUCCESS' END as Message

-- select  coalesce(cast(coalesce(cur.amount,0)as decimal(20,10)) ,'') as src,coalesce(TRGT.expense_loc_amount ,'')
FROM  
 
( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') header 

JOIN ( select * from #MDS_TABLE_SCHEMA.fx_currency_instance_final where (id, sys_created_on,field) in ( select id, max(sys_created_on),field from #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D' and field='amount' and (id is not null) group by id, sys_created_on,field)) cur 
on cur.id=header.sys_id and cur.field='amount'
-- WHERE header.asset is not null

 LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
 ON (header.sys_id=TRGT.row_id 
  AND header.sourceinstance=TRGT.source_id ) 
  where coalesce(cast(coalesce(cur.amount,0)as decimal(20,10)) ,'')<>coalesce(TRGT.expense_loc_amount ,'')
  and header.asset is not null
;