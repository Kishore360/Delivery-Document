select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_activity' else 'SUCCESS' end as Message
from <<tenant>>_mdwdb.f_request_activity TGT
left join <<tenant>>_mdwdb.f_request F 
on F.request_key = TGT.task_key
and F.soft_deleted_flag = 'N'
left join <<tenant>>_mdsdb.sys_audit_final SRC
on SRC.documentkey = F.row_id
left join <<tenant>>_mdwdb.d_request D 
on F.request_key = D.row_key
where TGT.primary_sequence_id = 0 and
concat(
trim(SUBSTRING(CONCAT('sc_request~',TGT.task_attribute_wh_name, '~',F.row_id,'~',0),1,255)),
COALESCE(F.source_id, ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(null, ''),
COALESCE(F.created_by, ''),
COALESCE(D.opened_on, ''),
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
COALESCE(TGT.task_attribute_wh_name, ''),
COALESCE(F.row_id, ''),
COALESCE('sc_request', ''),
COALESCE('0', ''),
COALESCE(null, ''),
-- COALESCE(SRC.user, ''), -- Cant use the user in the SQL as the code generates the user ID who runs the ETL, thus its different based on user
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
-- COALESCE(TGT.updated_by, ''),
COALESCE(TGT.wh_old_value_changed_on_key, ''));
