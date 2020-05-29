select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_item_activity.row_id' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_request_item_activity TGT
left join #DWH_TABLE_SCHEMA.f_request_item F 
on F.request_item_key = TGT.request_item_key
and F.soft_deleted_flag = 'N'
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id and SRC.sourceinstance=F.source_id
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N'
and trim(SUBSTRING(CONCAT('sc_req_item~',TGT.task_attribute_wh_name,'~',F.row_id,'~',0),1,255)) <> COALESCE(TGT.row_id,'')
union all
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_item_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' 
and COALESCE(SRC.sys_id,'')  <> COALESCE(TGT.row_id,'') 
) SQ;