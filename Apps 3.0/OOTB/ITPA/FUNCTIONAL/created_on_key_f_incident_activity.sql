select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_incident_activity.created_on_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from <<tenant>>_mdwdb.f_incident_activity TGT
left join <<tenant>>_mdwdb.f_incident F 
on F.incident_key = TGT.task_key and TGT.primary_sequence_id = 0 
and F.soft_deleted_flag = 'N'
where TGT.primary_sequence_id = 0 
and COALESCE(F.opened_on_key,'') <> COALESCE(TGT.created_on_key,'')
union
select TGT.row_id
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_incident_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid)
left join <<tenant>>_mdwdb.d_calendar_date CAL
on CAL.row_id = date_format(convert_tz(SRC.sys_created_on,L.source_time_zone,L.target_time_zone),'%Y%m%d') 
where TGT.primary_sequence_id <> 0 
and COALESCE(CAL.row_key,'') <> COALESCE(TGT.created_on_key,'')
) SQ;
