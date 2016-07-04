SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN COUNT(1) >0 THEN 'Soft_deleted_flag did not match for f_case_activity' 
ELSE 'SUCCESS' END as Message
FROM (
select TRGT.row_id
from <<tenant>>_mdsdb.sys_audit_bwd_delta SRC 
LEFT JOIN <<tenant>>_mdwdb.f_case_activity TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id )
WHERE TRGT.task_wh_type = 'sn_customerservice_case' and
CASE WHEN SRC.cdctype='A' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
) SQ
