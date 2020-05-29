select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_case_activity' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_case_activity TGT where TGT.task_wh_type = 'sn_customerservice_case') A, 
(select count(*) count_2 from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC where SRC.tablename = 'sn_customerservice_case' and SRC.fieldname in ('state', 'assignment_group')) B,
(select count(*) * 2 count_3 from #DWH_TABLE_SCHEMA.f_case F) C
where count_1 <> count_2 + count_3) SQ;