select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_item_activity.state_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_request_item_activity TGT
left join #DWH_TABLE_SCHEMA.f_request_item F 
on F.request_item_key = TGT.request_item_key
and F.soft_deleted_flag = 'N'
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N'
and COALESCE(null,'') <> COALESCE(TGT.state_key,'')
union all
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_item_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join #DWH_TABLE_SCHEMA.d_lov LOV
on LOV.row_id = concat('STATE~SC_REQ_ITEM~', SRC.newvalue)
and LOV.dimension_class = 'STATE~SC_REQ_ITEM'
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and TGT.task_attribute_wh_name in ('state', 'stage')
and COALESCE(null,'') <> COALESCE(TGT.state_key,'')
-- and COALESCE(LOV.row_key,'')  <> COALESCE(TGT.state_key,'') 
) SQ;
