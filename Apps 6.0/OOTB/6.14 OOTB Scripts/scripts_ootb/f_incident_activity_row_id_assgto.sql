select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.row_id' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_incident_activity TGT
left join #DWH_TABLE_SCHEMA.f_incident F 
on F.incident_key = TGT.task_key
and F.soft_deleted_flag = 'N'
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey=F.row_id
where TGT.primary_sequence_id = 0 and TGT.task_attribute_wh_name = 'assigned_to'
and trim(SUBSTRING(CONCAT('inc~','assigned_to~',F.row_id,'~',0),1,255)) <> TGT.row_id
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 
and COALESCE(SRC.sys_id,'') <> COALESCE(TGT.row_id,'')
) SQ

