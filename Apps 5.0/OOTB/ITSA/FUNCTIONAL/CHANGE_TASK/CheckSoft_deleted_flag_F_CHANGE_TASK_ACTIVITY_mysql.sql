SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN COUNT(1) >0 THEN 'Soft_deleted_flag did not match for f_change_task_activity' 
ELSE 'SUCCESS' END as Message
FROM (
select TRGT.row_id
from tjx_mdsdb.sys_audit_bwd_delta SRC 
LEFT JOIN tjx_mdwdb.f_change_task_activity TRGT 
ON (SRC.sys_id  =TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
WHERE TRGT.primary_sequence_id <>0 and CASE WHEN SRC.cdctype='A' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
union 
select TGT.row_id
from tjx_mdwdb.f_change_task_activity TGT
left join tjx_mdwdb.d_change_task D
on D.row_key = TGT.change_task_key
left join tjx_mdwdb.f_change_task F 
on F.row_id = D.row_id
and F.soft_deleted_flag = 'N'
left join tjx_mdsdb.sys_audit_final SRC
on SRC.documentkey = TGT.row_id
where TGT.primary_sequence_id = 0 and D.soft_deleted_flag = 'N'
 and COALESCE(TGT.soft_deleted_flag,'') <> COALESCE(TGT.soft_deleted_flag ,'')
) SQ
