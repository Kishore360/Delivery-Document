SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.rm_defect_final i 
LEFT JOIN cardinalhealth_mdwdb.f_defect_rm_c f ON i.sys_id=f.row_id 
	AND i.sourceinstance=f.source_id 
 where COALESCE(DATE_FORMAT(CONVERT_TZ(i.work_start,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED') <> work_start_c_key)temp;
 
 
 