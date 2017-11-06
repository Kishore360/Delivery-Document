SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'work_end_c_key not correct for f_enhancement_rm' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.rm_enhancement_final i 
LEFT JOIN cardinalhealth_mdwdb.f_enhancement_rm f ON i.sys_id=f.row_id 
	AND i.sourceinstance=f.source_id 
WHERE COALESCE(DATE_FORMAT(CONVERT_TZ(i.work_end,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED') <> f.work_end_c_key)temp;

