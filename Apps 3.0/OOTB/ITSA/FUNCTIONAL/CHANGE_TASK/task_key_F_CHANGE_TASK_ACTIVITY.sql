select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_change_task_activity.task_key' else 'SUCCESS' end as Message
from 
(
select TGT.row_id
from <<tenant>>_mdwdb.f_change_task_activity TGT
left join <<tenant>>_mdwdb.d_change_task D
on D.row_key = TGT.change_task_key
left join <<tenant>>_mdwdb.f_change_task F 
on F.row_id = D.row_id
and F.soft_deleted_flag = 'N'
left join <<tenant>>_mdsdb.sys_audit_final SRC
on SRC.documentkey = F.row_id
where TGT.primary_sequence_id = 0 and D.soft_deleted_flag = 'N'
and COALESCE(F.change_task_key,'') <> COALESCE(TGT.change_task_key,'')
union
select TGT.row_id
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_change_task_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
LEFT JOIN <<tenant>>_mdwdb.d_change_task D
on D.row_id = SRC.documentkey
where TGT.primary_sequence_id <> 0 
and COALESCE(case when D.row_key is null and SRC.documentkey is null then 0
when D.row_key is null and SRC.documentkey is not null then -1
else D.row_key end,'') <> COALESCE(TGT.change_task_key,'')
) SQ;