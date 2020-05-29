SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'state_ended_on did not match for f_change_request_activity' 
ELSE 'SUCCESS' END as Message
from (
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final SRC
join (select max(etl_run_number) as etl_run_no FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final WHERE CDCTYPE<>'D') etl_run_no on etl_run_no.etl_run_no = SRC.etl_run_number
WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT
on concat(TGT.task_wh_type,'~',TGT.task_attribute_wh_name,'~',SRC.documentkey,'~0') = TGT.row_id and SRC.sourceinstance=TGT.source_id
left join #DWH_TABLE_SCHEMA.f_change_request F 
on F.change_request_key = TGT.change_request_key
and F.soft_deleted_flag = 'N'
where TGT.primary_sequence_id = 0 and 
/*COALESCE(case when TGT.task_attribute_wh_name ='state' then adddate(TGT.created_on, INTERVAL TGT.primary_duration SECOND) 
when TGT.task_attribute_wh_name = 'assigned_to' then TGT.state_ended_on 
when TGT.task_attribute_wh_name = 'assignment_group' then TGT.state_ended_on 
else null
end,'')*/
COALESCE(null,'') <> COALESCE(TGT.state_ended_on,'')
union
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final SRC
join (select max(etl_run_number) as etl_run_no FROM #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final WHERE CDCTYPE<>'D') etl_run_no on etl_run_no.etl_run_no = SRC.etl_run_number
WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_request_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.primary_sequence_id <> 0 and 
/*COALESCE(case when TGT.task_attribute_wh_name ='state' then adddate(TGT.created_on, INTERVAL TGT.primary_duration SECOND) 
when TGT.task_attribute_wh_name = 'assigned_to' then TGT.state_ended_on 
when TGT.task_attribute_wh_name = 'assignment_group' then TGT.state_ended_on 
else null
end,'') */
COALESCE(null,'') <> COALESCE(TGT.state_ended_on,'')
) SQ ;