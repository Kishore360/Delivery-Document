SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.last_updated_on_key'
ELSE 'SUCCESS' END as Message
FROM 
(select request_item_key, max(changed_on) as changed_on_max from #DWH_TABLE_SCHEMA.f_request_item
where soft_deleted_flag = 'N' group by request_item_key) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on cast(SRC.changed_on_max as date)=LKP.calendar_date
left join #DWH_TABLE_SCHEMA.f_request_item TRGT
on SRC.request_item_key = TRGT.request_item_key
WHERE coalesce(LKP.row_key,'') <> coalesce(TRGT.last_updated_on_key,'');