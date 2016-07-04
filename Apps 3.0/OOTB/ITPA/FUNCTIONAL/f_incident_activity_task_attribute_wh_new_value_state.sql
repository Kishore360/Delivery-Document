select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.task_attribute_wh_new_value' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from <<tenant>>_mdwdb.f_incident_activity TGT
 left join <<tenant>>_mdwdb.f_incident F 
on F.incident_key = TGT.task_key and TGT.task_attribute_wh_name = 'state' and TGT.primary_sequence_id = 0 
and F.soft_deleted_flag = 'N'
left join <<tenant>>_mdwdb.f_incident_activity TGT2
on (F.incident_key=TGT2.task_key and TGT2.primary_sequence_id = 1 and TGT2.task_attribute_wh_name = 'state')
where
 TGT.primary_sequence_id = 0 
 and TGT.task_attribute_wh_name = 'state'
 and 
COALESCE(coalesce(TGT2.task_attribute_wh_old_value, F.state_src_code),'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
union
select TGT.row_id
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 
and COALESCE(SRC.newvalue,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
) SQ
