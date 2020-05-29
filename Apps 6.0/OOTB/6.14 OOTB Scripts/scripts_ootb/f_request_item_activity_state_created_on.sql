select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_request_item_activity.state_created_on' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_request_item_activity TGT
left join #DWH_TABLE_SCHEMA.f_request_item F 
on F.request_item_key = TGT.request_item_key
and F.soft_deleted_flag = 'N'
left join #DWH_TABLE_SCHEMA.d_request_item D 
on F.request_item_key = D.row_key
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id and SRC.sourceinstance=F.source_id
where TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N'
and COALESCE(null, '') <> COALESCE(TGT.state_created_on,'')
-- and COALESCE(D.opened_on, '') <> COALESCE(TGT.state_created_on,'')
union all
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_item_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname = 'state' 
and COALESCE(null, '') <> COALESCE(TGT.state_created_on,'')
-- and COALESCE(convert_tz(SRC.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '')  <> COALESCE(TGT.state_created_on,'') 
/*union all
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request_item_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join 
(select LKP.request_item_key, LKP.source_id, LKP.state_created_on, LKP.state_key 
from #DWH_TABLE_SCHEMA.f_request_item_activity LKP
where LKP.task_attribute_wh_name in ('state', 'stage')
group by LKP.request_item_key, LKP.source_id, LKP.state_created_on) base
ON TGT.request_item_key = base.request_item_key and TGT.state_created_on = base.state_created_on
where TGT.primary_sequence_id <> 0 and TGT.soft_deleted_flag = 'N' and SRC.fieldname <> 'state' 
and COALESCE(base.assigned_to_key, -1)  <> COALESCE(TGT.state_created_on,'') */
) SQ;
