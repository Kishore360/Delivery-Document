select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.task_attribute_wh_new_value' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from <<tenant>>_mdwdb.f_incident_activity TGT
left join <<tenant>>_mdwdb.d_internal_organization d 
on TGT.assignment_group_key = d.row_key
where TGT.primary_sequence_id = 0 and
 TGT.task_attribute_wh_name = 'assignment_group' 
and coalesce(substr(d.row_id,locate('~',d.row_id)+1,char_length(d.row_id)),'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
union
select TGT.row_id
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 
and COALESCE(SRC.newvalue,'') <> COALESCE(TGT.task_attribute_wh_new_value,'')
) SQ
