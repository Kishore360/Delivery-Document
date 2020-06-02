select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_activity.assignment_group_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_request_activity TGT
left join #DWH_TABLE_SCHEMA.f_request F 
on F.request_key = TGT.request_key
and F.soft_deleted_flag = 'N'
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N'
and COALESCE(null,'') <> COALESCE(TGT.assignment_group_key,'')
union all
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN  #DWH_TABLE_SCHEMA.d_internal_organization IO
ON  IO.row_id=concat('GROUP~',SRC.newvalue) 
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname = 'assignment_group' 
and COALESCE(null,'') <> COALESCE(TGT.assignment_group_key,'') 
union all
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join 
(select LKP.row_id, LKP.request_key, LKP.source_id, LKP.state_created_on, LKP.assignment_group_key 
from #DWH_TABLE_SCHEMA.f_request_activity LKP
where LKP.task_attribute_wh_name = 'assignment_group'
group by LKP.row_id, LKP.request_key, LKP.source_id, LKP.state_created_on) base
ON TGT.request_key = base.request_key and TGT.state_created_on = base.state_created_on
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname <> 'assignment_group' 
and COALESCE(null,'') <> COALESCE(TGT.assignment_group_key,'') 
) SQ;
