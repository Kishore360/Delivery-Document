select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_problem_activity' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_problem_activity TGT join #DWH_TABLE_SCHEMA.f_problem F on F.problem_key = TGT.problem_key 
where F.soft_deleted_flag = 'N' and TGT.soft_deleted_flag = 'N') A, 
(select count(*) count_2 from #DWH_TABLE_SCHEMA.f_problem F join #DWH_TABLE_SCHEMA.d_problem D on D.row_key = F.problem_key 
where F.soft_deleted_flag = 'N') B, 
(select count(*) count_3 from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC join #DWH_TABLE_SCHEMA.f_problem F on F.row_id = SRC.documentkey 
where SRC.tablename = 'problem' and SRC.fieldname in ('problem_state') and F.soft_deleted_flag = 'N') C
where count_1 <> (count_2+count_3)) SQ;