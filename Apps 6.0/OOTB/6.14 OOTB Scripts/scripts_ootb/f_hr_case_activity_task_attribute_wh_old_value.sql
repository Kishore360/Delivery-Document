select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_hr_case_activity.task_attribute_wh_old_value' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_hr_case_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
WHERE  TGT.task_wh_type = 'hr_case'
and COALESCE(SRC.oldvalue,'') <> COALESCE(TGT.task_attribute_wh_old_value,'')
) SQ