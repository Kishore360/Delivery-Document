select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_activity.task_attribute_wh_new_value' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_request_activity TGT
left join #DWH_TABLE_SCHEMA.d_request D
on D.row_key = TGT.request_key
left join #DWH_TABLE_SCHEMA.f_request F 
on F.row_id = D.row_id
and F.soft_deleted_flag = 'N'
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id
left join #DWH_TABLE_SCHEMA.f_request_activity TGT2
on (F.request_key=TGT2.request_key AND SRC.sourceinstance=TGT2.source_id and TGT2.primary_sequence_id = 1)
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N' and D.soft_deleted_flag = 'N' AND TGT.task_attribute_wh_name = 'request_state'
and COALESCE(null,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
-- and coalesce(TGT2.task_attribute_wh_old_value, F.state_src_code,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
union 
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_request_activity TGT
left join #DWH_TABLE_SCHEMA.d_request D
on D.row_key = TGT.request_key
left join #DWH_TABLE_SCHEMA.f_request F 
on F.row_id = D.row_id
and F.soft_deleted_flag = 'N'
AND TGT.task_attribute_wh_name = 'stage' 
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id
left join #DWH_TABLE_SCHEMA.f_request_activity TGT2
on (F.request_key=TGT2.request_key AND TGT2.task_attribute_wh_name = 'stage' AND SRC.sourceinstance=TGT2.source_id and TGT2.primary_sequence_id = 1)
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N' AND TGT.task_attribute_wh_name = 'stage' and D.soft_deleted_flag = 'N'
and COALESCE(null,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
-- and COALESCE(coalesce(TGT2.task_attribute_wh_old_value, F.stage_src_code),'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' 
and COALESCE(SRC.newvalue,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
) SQ