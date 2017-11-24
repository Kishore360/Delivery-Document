

  
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.reassignment_count_numerify_c' ELSE 'SUCCESS' END as Message
FROM (  
SELECT count(1) as CNT FROM 
(SELECT a.sourceinstance,a.documentkey,count(1) as CNT
FROM gilead_mdsdb.sys_audit_final a  WHERE a.fieldname='assignment_group' and tablename='sc_task' and oldvalue IS NOT NULL
group by a.sourceinstance,a.documentkey) SRC
JOIN gilead_mdwdb.f_request_task TRGT ON (SRC.documentkey=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.CNT,0) <> TRGT.reassignment_count_numerify_c
 )a; 