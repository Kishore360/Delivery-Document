SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.last_reprioritized_on_key'
ELSE 'SUCCESS' END as Message FROM #MDS_TABLE_SCHEMA.sc_req_item_final SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
left join (select sourceinstance,documentkey,max(sys_created_on) as created_date from #MDS_TABLE_SCHEMA.sys_audit_final
 where tablename = 'sc_req_item' and fieldname = 'priority'
group by 1,2) sa
on sa.documentkey = SRC.sys_id and sa.sourceinstance = SRC.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on 
(LKP.row_id = date_format(convert_tz(coalesce(sa.created_date),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d')  
and LKP.source_id=0)
WHERE coalesce(LKP.row_key,'') <> coalesce(TRGT.last_reprioritized_on_key,'');