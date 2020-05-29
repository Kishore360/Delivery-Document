select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_change_request_activity.created_time_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from #DWH_TABLE_SCHEMA.f_change_request_activity TGT
left join #DWH_TABLE_SCHEMA.d_change_request D
on D.row_key = TGT.change_request_key
left join #DWH_TABLE_SCHEMA.f_change_request F 
on F.row_id = D.row_id
and F.soft_deleted_flag = 'N'
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final WHERE CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id
where TGT.primary_sequence_id = 0 and F.soft_deleted_flag = 'N'
and COALESCE(F.opened_time_key,'') <> COALESCE(TGT.created_time_key,'')
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join #DWH_TABLE_SCHEMA.d_calendar_time CAL
on CAL.row_id = date_format(SRC.sys_created_on,'%H%i') and CAL.source_id=0
where TGT.primary_sequence_id <> 0 
and COALESCE(CAL.row_key,'') <> COALESCE(TGT.created_time_key,'')
) SQ;
