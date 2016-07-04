select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_case_activity' else 'SUCCESS' end as Message
from 
(select 1 from
(select count(1) count_1 from <<tenant>>_mdwdb.f_case_activity TGT where TGT.task_wh_type = 'sn_customerservice_case') A, 
(select count(1) count_2 from <<tenant>>_mdsdb.sys_audit_final SRC where SRC.tablename = 'sn_customerservice_case') B
where count_1 <> count_2) SQ;
