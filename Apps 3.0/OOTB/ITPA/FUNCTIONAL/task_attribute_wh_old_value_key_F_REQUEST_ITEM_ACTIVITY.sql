select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_item_activity.task_attribute_wh_old_value_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from <<tenant>>_mdwdb.f_request_item_activity TGT
left join <<tenant>>_mdwdb.f_request_item F 
on F.request_item_key = TGT.task_key
and F.soft_deleted_flag = 'N'
left join <<tenant>>_mdsdb.sys_audit_final SRC
on SRC.documentkey = F.row_id
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_id = 'UNSPECIFIED'
where TGT.primary_sequence_id = 0 
and COALESCE(LOV.row_key,'') <> COALESCE(TGT.task_attribute_wh_old_value_key,'')
union
select TGT.row_id
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_request_item_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id and TGT.task_attribute_wh_name = 'state')
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_id = concat('state~sc_req_item~~~', SRC.oldvalue)
and LOV.dimension_class = 'state~sc_req_item'
where TGT.primary_sequence_id <> 0 
and COALESCE(case when SRC.oldvalue is not null and LOV.row_key is not null then LOV.row_key
when SRC.oldvalue is not null and LOV.row_key is null then -1 else 0 end,'') <> COALESCE(TGT.task_attribute_wh_old_value_key,'')
union
select TGT.row_id
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_request_item_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id and TGT.task_attribute_wh_name = 'stage')
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_id = concat('stage~sc_req_item~~~', SRC.oldvalue)
and LOV.dimension_class = 'stage~sc_req_item'
where TGT.primary_sequence_id <> 0 
and COALESCE(case when SRC.oldvalue is not null and LOV.row_key is not null then LOV.row_key
when SRC.oldvalue is not null and LOV.row_key is null then -1 else 0 end,'') <> COALESCE(TGT.task_attribute_wh_old_value_key,'')
) SQ;
