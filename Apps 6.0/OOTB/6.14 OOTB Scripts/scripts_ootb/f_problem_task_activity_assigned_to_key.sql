select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_problem_task_activity.assigned_to_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_problem_task_activity TGT
left join #DWH_TABLE_SCHEMA.f_problem_task F 
on F.problem_task_key = TGT.problem_task_key
and F.soft_deleted_flag = 'N'
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N'
and COALESCE(null,'') <> COALESCE(TGT.assigned_to_key,'')
union all
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_problem_task_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN  #DWH_TABLE_SCHEMA.d_internal_contact IC
ON  IC.row_id=concat('INTERNAL_CONTACT~',SRC.newvalue)
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname = 'assigned_to' 
and COALESCE(null,'')  <> COALESCE(TGT.assigned_to_key,'') 
union all
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_problem_task_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join 
(select LKP.problem_task_key, LKP.source_id, LKP.state_created_on, LKP.assigned_to_key 
from #DWH_TABLE_SCHEMA.f_problem_task_activity LKP
where LKP.task_attribute_wh_name = 'assigned_to'
group by LKP.problem_task_key, LKP.source_id, LKP.state_created_on) base
ON TGT.problem_task_key = base.problem_task_key and TGT.state_created_on = base.state_created_on
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname <> 'assigned_to' 
and COALESCE(null,'') <> COALESCE(TGT.assigned_to_key,'') 
) SQ;
