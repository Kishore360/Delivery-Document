select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.assignment_group_key' else 'SUCCESS' end as Message
from
(select TGT.row_id
from (SELECT * FROM #MDS_TABLE_SCHEMA.bmc_hpd_help_desk_sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on concat(TGT.task_wh_type,'~',TGT.task_attribute_wh_name,'~',SRC.documentkey,'~0') = TGT.row_id and SRC.sourceinstance=TGT.source_id
left join #DWH_TABLE_SCHEMA.f_incident F 
on F.incident_key = TGT.incident_key
and F.soft_deleted_flag = 'N'
where TGT.primary_sequence_id = 0 and 
COALESCE(case when TGT.task_attribute_wh_name='assignment_group' then TGT.task_attribute_wh_new_value_key
when TGT.task_attribute_wh_name='assigned_to' then TGT.assignment_group_key
when TGT.task_attribute_wh_name='state' then TGT.assignment_group_key
else null end,'') <> COALESCE(TGT.assignment_group_key,'')
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_hpd_help_desk_sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and 
COALESCE(case when TGT.task_attribute_wh_name='assignment_group' then TGT.task_attribute_wh_new_value_key
when TGT.task_attribute_wh_name='assigned_to' then TGT.assignment_group_key
when TGT.task_attribute_wh_name='state' then TGT.assignment_group_key
else null end,'') <> COALESCE(TGT.assignment_group_key,'')) SQ;