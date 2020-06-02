select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_change_task_activity.task_attribute_wh_new_value_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_change_task_activity TGT
left join #DWH_TABLE_SCHEMA.f_change_task F 
on F.change_task_key = TGT.change_task_key
left join #DWH_TABLE_SCHEMA.f_change_task_activity TGT2
on (TGT.change_task_key=TGT2.change_task_key AND TGT.source_id=TGT2.source_id AND TGT.task_attribute_wh_name = TGT2.task_attribute_wh_name and TGT2.primary_sequence_id = 1)
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N' and F.soft_deleted_flag = 'N'
and COALESCE(TGT2.task_attribute_wh_old_value_key, 
case when TGT.task_attribute_wh_name = 'state' then F.state_src_key 
when TGT.task_attribute_wh_name = 'assignment_group' then F.assignment_group_key 
else 0 end,0) <> COALESCE(TGT.task_attribute_wh_new_value_key,'')

union all

select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_task_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_id = concat('STATE~CHANGE_TASK~', SRC.newvalue)
and LOV.dimension_class = 'STATE~CHANGE_TASK'
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname = 'state' 
and COALESCE(LOV.row_key, case when SRC.newvalue is not null and LOV.row_key is null then -1 else 0 end) <> COALESCE(TGT.task_attribute_wh_new_value_key,'')

union all

select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_task_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN  #DWH_TABLE_SCHEMA.d_internal_organization IO
ON  IO.row_id=concat('GROUP~',SRC.newvalue) 
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname = 'assignment_group' 
and COALESCE(IO.row_key, case when SRC.newvalue is null then 0 else -1 end) <> COALESCE(TGT.task_attribute_wh_new_value_key,'')
) SQ;