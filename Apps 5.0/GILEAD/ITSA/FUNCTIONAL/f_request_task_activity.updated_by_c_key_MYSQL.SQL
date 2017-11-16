SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task_activity.updated_by_c_key' ELSE 'SUCCESS' END as Message
FROM (  
SELECT Count(1) as CNT 
FROM gilead_mdsdb.sys_audit_final a
JOIN gilead_mdsdb.sys_user_final c ON (a.sys_created_by=c.user_name and a.sourceinstance=c.sourceinstance)
JOIN gilead_mdwdb.d_internal_contact LKP ON (CONCAT('INTERNAL_CONTACT~',c.sys_id)=LKP.row_id)
JOIN gilead_mdwdb.gilead_mdwdb.f_request_task_activity b  ON (a.sys_id=b.row_id and a.sourceinstance=b.source_id)
Where a.tablename='sc_task' 
and COALESCE(LKP.row_key,CASE WHEN c.sys_id IS NULL THEN 0 ELSE -1 END)<>b.updated_by_c_key
 )a;

 
 