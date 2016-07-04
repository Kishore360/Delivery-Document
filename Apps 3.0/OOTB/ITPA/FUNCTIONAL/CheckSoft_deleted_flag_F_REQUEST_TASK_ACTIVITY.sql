SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN COUNT(1) >0 THEN 'Soft_deleted_flag did not match for f_request_task_activity' ELSE 'SUCCESS' END as Message
FROM (
select TRGT.row_id
from <<tenant>>_mdsdb.sys_audit_bwd_delta SRC 
LEFT JOIN <<tenant>>_mdwdb.f_request_task_activity TRGT 
ON (SRC.sys_id =TRGT.row_id 
AND SRC.sourceinstance= TRGT.source_id)
WHERE TRGT.primary_sequence_id <>0 and CASE WHEN SRC.cdctype='A' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
union 
select TGT.row_id
from <<tenant>>_mdwdb.f_request_task_activity TGT
left join <<tenant>>_mdwdb.f_request_task F 
on F.request_task_key = TGT.task_key
and F.soft_deleted_flag = 'N'
left join <<tenant>>_mdsdb.sys_audit_final SRC
on SRC.documentkey = F.row_id
where TGT.primary_sequence_id = 0 and COALESCE(F.soft_deleted_flag,'') <> COALESCE(TGT.soft_deleted_flag ,'')
) SQ
