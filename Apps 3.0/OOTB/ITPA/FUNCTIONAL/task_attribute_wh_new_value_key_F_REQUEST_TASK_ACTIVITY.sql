select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_task_activity.task_attribute_wh_new_value_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from <<tenant>>_mdwdb.f_request_task_activity TGT
left join <<tenant>>_mdwdb.f_request_task F 
on F.request_task_key = TGT.task_key
and F.soft_deleted_flag = 'N'
left join <<tenant>>_mdsdb.sys_audit_final SRC
on SRC.documentkey = F.row_id
left join <<tenant>>_mdwdb.f_request_task_activity TGT2
on (F.request_task_key=TGT2.task_key AND SRC.sourceinstance=TGT2.source_id and TGT2.primary_sequence_id = 1)
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_id = concat('STATE~sc_task~~~',coalesce(TGT2.task_attribute_wh_old_value, F.state_src_code)) and LOV.dimension_class = 'state~sc_task'
where TGT.primary_sequence_id = 0 
and COALESCE(LOV.row_key,'') <> COALESCE(TGT.task_attribute_wh_new_value_key,'')
union
select TGT.row_id
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_request_task_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_id = concat('STATE~sc_task~~~', SRC.newvalue)
and LOV.dimension_class = 'state~sc_task'
where TGT.primary_sequence_id <> 0 
and COALESCE(case when SRC.newvalue is not null and LOV.row_key is not null then LOV.row_key
when SRC.newvalue is not null and LOV.row_key is null then -1 else 0 end,'') <> COALESCE(TGT.task_attribute_wh_new_value_key,'')
) SQ;
