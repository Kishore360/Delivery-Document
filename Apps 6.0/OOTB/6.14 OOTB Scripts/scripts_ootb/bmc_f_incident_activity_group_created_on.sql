SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'group_created_on did not match for f_incident_activity' 
ELSE 'SUCCESS' END as Message
from(
select TGT.row_id
from (SELECT * FROM #MDS_TABLE_SCHEMA.bmc_hpd_help_desk_sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on concat(TGT.task_wh_type,'~',TGT.task_attribute_wh_name,'~',SRC.documentkey,'~0') = TGT.row_id and SRC.sourceinstance=TGT.source_id
left join #DWH_TABLE_SCHEMA.f_incident F 
on F.incident_key = TGT.incident_key
and F.soft_deleted_flag = 'N'
where TGT.primary_sequence_id = 0 and 
COALESCE(case when TGT.task_attribute_wh_name ='assignment_group' then TGT.created_on 
when TGT.task_attribute_wh_name = 'assigned_to' then TGT.group_created_on 
when TGT.task_attribute_wh_name = 'state' then TGT.group_created_on 
else null
end,'') <> COALESCE(TGT.group_created_on,'')
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_hpd_help_desk_sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and 
COALESCE(case when TGT.task_attribute_wh_name ='assignment_group'then TGT.created_on
when TGT.task_attribute_wh_name = 'assigned_to' then TGT.group_created_on 
when TGT.task_attribute_wh_name = 'state' then TGT.group_created_on 
else null
end,'') <> COALESCE(TGT.group_created_on,'') )SQ;
