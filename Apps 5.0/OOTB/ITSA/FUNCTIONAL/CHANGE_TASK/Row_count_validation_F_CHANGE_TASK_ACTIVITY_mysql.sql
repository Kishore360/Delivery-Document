select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_change_task_activity' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from <<tenant>>_mdwdb.f_change_task_activity TGT) A, 
(select count(*) count_2 from <<tenant>>_mdwdb.f_change_task F where F.soft_deleted_flag = 'N') B, 
(select count(*) count_3 from <<tenant>>_mdsdb.sys_audit_final SRC where SRC.tablename = 'change_task' and SRC.fieldname='state') C
where count_1 <> (count_2+count_3)) SQ;