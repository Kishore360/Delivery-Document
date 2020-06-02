select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_hr_case_activity' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_hr_case_activity TGT WHERE  TGT.task_wh_type = 'hr_case') A, 
(select count(*) count_2 from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC WHERE  SRC.tablename = 'hr_case') B
WHERE count_1 <> count_2) SQ;