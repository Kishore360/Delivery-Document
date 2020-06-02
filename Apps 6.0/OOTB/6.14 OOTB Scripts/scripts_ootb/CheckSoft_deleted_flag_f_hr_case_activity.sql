SELECT CASE WHEN COUNT(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN COUNT(1) >0 THEN 'Soft_deleted_flag did not match for f_hr_case_activity' 
ELSE 'SUCCESS' END as Message
FROM (
select TRGT.row_id
from  #MDS_TABLE_SCHEMA.sys_audit_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_hr_case_activity TRGT 
ON (SRC.sys_id  =TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
WHERE  SRC.tablename = 'hr_case' AND TRGT.task_wh_type = 'hr_case' and
CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
) SQ
