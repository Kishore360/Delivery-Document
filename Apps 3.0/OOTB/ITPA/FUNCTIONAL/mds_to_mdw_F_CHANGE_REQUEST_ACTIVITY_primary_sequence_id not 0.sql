select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_change_request_activity' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.sys_audit_final SRC

left join <<tenant>>_mdwdb.f_change_request_activity TGT
on (SRC.sys_id = TGT.row_id AND SRC.sourceinstance = TGT.source_id)
where -- SRC.fieldname = 'STATE' and
TGT.primary_sequence_id <> 0 and
concat(
COALESCE(SRC.sys_id, ''),
COALESCE(SRC.sourceinstance, ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(SRC.sys_created_by, ''),
COALESCE(convert_tz(SRC.sys_created_on,'GMT','America/Los_Angeles'), ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE('N', ''),
COALESCE('N', ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(SRC.fieldname, ''),
COALESCE(SRC.documentkey, ''),
COALESCE(SRC.tablename, ''),
COALESCE(SRC.record_checkpoint, ''),
COALESCE(SRC.reason, ''),
COALESCE(SRC.user, ''),
COALESCE(null, '')) <>
concat( 
COALESCE(TGT.row_id, ''),
COALESCE(TGT.source_id, ''),
COALESCE(TGT.assignment_group_key, ''),
COALESCE(TGT.changed_by, ''),
COALESCE(TGT.changed_on, ''),
COALESCE(TGT.created_by, ''),
COALESCE(TGT.created_on, ''),
COALESCE(TGT.duration, ''),
COALESCE(TGT.ended_on, ''),
COALESCE(TGT.group_created_on, ''),
COALESCE(TGT.group_ended_on, ''),
COALESCE(TGT.reassigned_flag, ''),
COALESCE(TGT.reopened_flag, ''),
COALESCE(TGT.secondary_duration, ''),
COALESCE(TGT.secondary_sequence_id, ''),
COALESCE(TGT.sequence_id, ''),
COALESCE(TGT.started_on, ''),
COALESCE(TGT.state_created_on, ''),
COALESCE(TGT.state_ended_on, ''),
COALESCE(TGT.state_key, ''),
COALESCE(TGT.task_attribute_wh_name, ''),
COALESCE(TGT.task_row_id, ''),
COALESCE(TGT.task_wh_type, ''),
COALESCE(TGT.update_count, ''),
COALESCE(TGT.update_reason, ''),
COALESCE(TGT.updated_by, ''),
COALESCE(TGT.wh_old_value_changed_on_key, ''));