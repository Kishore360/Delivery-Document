SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS TO MDW DATA VALIDATION FAILED' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdsdb.rm_enhancement_final i
LEFT JOIN cardinalhealth_mdwdb.f_enhancement_rm f ON i.sys_id=f.row_id
                AND i.sourceinstance=f.source_id
where COALESCE(DATE_FORMAT(CONVERT_TZ(i.due_date,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')<>f.due_c_key)temp;
