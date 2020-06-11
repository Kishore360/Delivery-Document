
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_expense_item.loc_currency_code' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ( select * from #MDS_TABLE_SCHEMA.fx_currency_instance_final where (id, sys_created_on,field) in ( select id, max(sys_created_on),field from #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D' and field='amount' and (id is not null) group by id, sys_created_on,field)) FX1
ON(FX1.id=SRC.sys_id and FX1.field='amount') 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( FX1.currency ,'')<> COALESCE(TRGT.loc_currency_code ,'')
