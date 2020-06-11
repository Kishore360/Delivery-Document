select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_item_activity.created_time_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_request_item_activity TGT
left join #DWH_TABLE_SCHEMA.d_request_item D
on D.row_key = TGT.request_item_key
left join #DWH_TABLE_SCHEMA.f_request_item F 
on F.row_id = D.row_id
left join #DWH_TABLE_SCHEMA.d_calendar_time CAL
on (CAL.row_id = date_format(D.opened_on,'%H%i') and CAL.source_id=0)
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = D.row_id
where TGT.primary_sequence_id = 0  and F.soft_deleted_flag = 'N'
and COALESCE(CAL.row_key,'') <> COALESCE(TGT.created_time_key,'')
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_item_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join #DWH_TABLE_SCHEMA.d_calendar_time CAL
on CAL.row_id = date_format(convert_tz(SRC.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%H%i') and CAL.source_id=0
where TGT.primary_sequence_id <> 0 
and COALESCE(CAL.row_key,'') <> COALESCE(TGT.created_time_key,'')
) SQ;
