select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_item_activity.task_attribute_wh_new_value_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from <<tenant>>_mdwdb.f_request_item_activity TGT
left join <<tenant>>_mdwdb.f_request_item F 
on F.request_item_key = TGT.task_key
and F.soft_deleted_flag = 'N'
and TGT.task_attribute_wh_name = 'state'
left join <<tenant>>_mdsdb.sys_audit_final SRC
on SRC.documentkey = F.row_id
left join <<tenant>>_mdwdb.f_request_item_activity TGT2
on (F.request_item_key=TGT2.task_key AND SRC.sourceinstance=TGT2.source_id and TGT2.primary_sequence_id = 1 and TGT2.task_attribute_wh_name = 'state')
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_id = concat('state~sc_req_item~~~',coalesce(TGT2.task_attribute_wh_old_value, F.state_src_code)) and LOV.dimension_class = 'state~sc_req_item'
where TGT.primary_sequence_id = 0 and TGT.task_attribute_wh_name = 'state'
and COALESCE(LOV.row_key,'') <> COALESCE(TGT.task_attribute_wh_new_value_key,'')
union
select TGT.row_id
from <<tenant>>_mdwdb.f_request_item_activity TGT
left join <<tenant>>_mdwdb.f_request_item F 
on F.request_item_key = TGT.task_key
and F.soft_deleted_flag = 'N'
and TGT.task_attribute_wh_name = 'stage'
left join <<tenant>>_mdsdb.sys_audit_final SRC
on SRC.documentkey = F.row_id
left join <<tenant>>_mdwdb.f_request_item_activity TGT2
on (F.request_item_key=TGT2.task_key AND SRC.sourceinstance=TGT2.source_id and TGT2.primary_sequence_id = 1 and TGT2.task_attribute_wh_name = 'stage')
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_id = concat('stage~sc_req_item~~~',coalesce(TGT2.task_attribute_wh_old_value, F.stage_src_code)) and LOV.dimension_class = 'stage~sc_req_item'
where TGT.primary_sequence_id = 0 and TGT.task_attribute_wh_name = 'stage'
and COALESCE(case when coalesce(TGT2.task_attribute_wh_old_value, F.stage_src_code) is null and LOV.row_key is null then 0
when coalesce(TGT2.task_attribute_wh_old_value, F.stage_src_code) is not null and LOV.row_key is null then -1
when coalesce(TGT2.task_attribute_wh_old_value, F.stage_src_code) is not null and LOV.row_key is not null then LOV.row_key end,'') 
<> COALESCE(TGT.task_attribute_wh_new_value_key,'')
union
select TGT.row_id
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_request_item_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id and TGT.task_attribute_wh_name = 'state')
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_id = concat('state~sc_req_item~~~', SRC.newvalue)
and LOV.dimension_class = 'state~sc_req_item'
where TGT.primary_sequence_id <> 0 
and COALESCE(case when SRC.newvalue is not null and LOV.row_key is not null then LOV.row_key
when SRC.newvalue is not null and LOV.row_key is null then -1 else 0 end,'') <> COALESCE(TGT.task_attribute_wh_new_value_key,'')
union
select TGT.row_id
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_request_item_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id and TGT.task_attribute_wh_name = 'stage')
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_id = concat('stage~sc_req_item~~~', SRC.newvalue)
and LOV.dimension_class = 'stage~sc_req_item'
where TGT.primary_sequence_id <> 0 
and COALESCE(case when SRC.newvalue is not null and LOV.row_key is not null then LOV.row_key
when SRC.newvalue is not null and LOV.row_key is null then -1 else 0 end,'') <> COALESCE(TGT.task_attribute_wh_new_value_key,'')
) SQ;
