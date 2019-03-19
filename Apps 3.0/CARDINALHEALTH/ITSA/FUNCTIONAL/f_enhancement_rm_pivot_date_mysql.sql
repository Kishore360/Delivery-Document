SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS TO MDW DATA VALIDATION FAILED' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdsdb.rm_enhancement_final i
LEFT JOIN cardinalhealth_mdwdb.f_enhancement_rm f ON i.sys_id=f.row_id
                AND i.sourceinstance=f.source_id
                WHERE CONVERT_TZ (i.opened_at,'GMT','America/New_York') <> f.pivot_date)temp;
				
 