SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdsdb.rm_defect_final i 
JOIN cardinalhealth_mdwdb.d_defect_rm_c d ON d.row_id=i.sys_id 
	AND d.source_id=i.sourceinstance
	WHERE CONVERT_TZ(i.start_date,'GMT','America/New_York') <>d.start_date)temp;
	