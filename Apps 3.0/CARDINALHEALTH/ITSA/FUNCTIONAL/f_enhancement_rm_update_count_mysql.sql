SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Data mismatched' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
 FROM  cardinalhealth_mdsdb.rm_enhancement_final i 
LEFT JOIN cardinalhealth_mdwdb.f_enhancement_rm f ON i.sys_id=f.row_id 
	AND i.sourceinstance=f.source_id 
	where COALESCE(i.sys_mod_count,0)<>f.update_count)temp;
	