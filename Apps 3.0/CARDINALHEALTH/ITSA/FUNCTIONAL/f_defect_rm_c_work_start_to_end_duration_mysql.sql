SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdsdb.rm_defect_final i 
JOIN cardinalhealth_mdwdb.f_defect_rm_c d ON d.row_id=i.sys_id 
	AND d.source_id=i.sourceinstance
	WHERE TIMESTAMPDIFF(SECOND,i.work_start,i.work_end) <> d.work_start_to_end_duration)temp;
	