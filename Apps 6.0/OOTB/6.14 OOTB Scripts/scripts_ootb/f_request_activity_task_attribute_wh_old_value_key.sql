select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_activity.task_attribute_wh_old_value_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_request_activity TGT
left join #DWH_TABLE_SCHEMA.f_request F 
on F.request_key = TGT.request_key
and F.soft_deleted_flag = 'N'
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id and SRC.sourceinstance = TGT.source_id
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_id = 'UNSPECIFIED'
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N' 
and COALESCE(LOV.row_key,0) <> COALESCE(TGT.task_attribute_wh_old_value_key,0)
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id and TGT.task_attribute_wh_name = 'request_state')
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_id = concat('REQUEST_STATE~SC_REQUEST~', SRC.oldvalue)
and LOV.dimension_class = 'REQUEST_STATE~SC_REQUEST'
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' 
and COALESCE(LOV.row_key, case when SRC.oldvalue is not null then -1 else 0 end,'') <> COALESCE(TGT.task_attribute_wh_old_value_key,'')
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id and TGT.task_attribute_wh_name = 'stage')
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_id = concat('STAGE~SC_REQUEST~', SRC.oldvalue)
and LOV.dimension_class = 'STAGE~SC_REQUEST'
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' 
and COALESCE(case when SRC.oldvalue is not null and LOV.row_key is not null then LOV.row_key
when SRC.oldvalue is not null and LOV.row_key is null then -1 else 0 end,'') <> COALESCE(TGT.task_attribute_wh_old_value_key,'')
) SQ;