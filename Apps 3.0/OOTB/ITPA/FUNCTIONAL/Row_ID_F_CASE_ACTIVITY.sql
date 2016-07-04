select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_case_activity.row_id' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_case_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
where TGT.task_wh_type = 'sn_customerservice_case'
and COALESCE(SRC.sys_id,'') <> COALESCE(TGT.row_id,'') 
) SQ;
