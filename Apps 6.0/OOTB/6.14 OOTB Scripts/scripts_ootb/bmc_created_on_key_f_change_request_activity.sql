select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_change_request_activity.created_on_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from (SELECT * FROM #STG_TABLE_SCHEMA.chg_infrastructure_change_sys_audit WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT
on concat(TGT.task_wh_type,'~',TGT.task_attribute_wh_name,'~',SRC.documentkey,'~0') = TGT.row_id and SRC.sourceinstance=TGT.source_id
left join #DWH_TABLE_SCHEMA.f_change_request F 
on F.change_request_key = TGT.change_request_key
and F.soft_deleted_flag = 'N'
where TGT.primary_sequence_id = 0
and COALESCE(F.opened_on_key,'') <> COALESCE(TGT.created_on_key,'')
union
select TGT.row_id
from ( SELECT * FROM #STG_TABLE_SCHEMA.chg_infrastructure_change_sys_audit WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_id = date_format(SRC.sys_created_on,'%Y%m%d') 
where TGT.primary_sequence_id <> 0 
and COALESCE(CAL.row_key,'') <> COALESCE(TGT.created_on_key,'')
) SQ;
