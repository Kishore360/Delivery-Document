SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdsdb.rm_enhancement_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_calendar_date LKP
on LKP.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.opened_at,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')      LEFT JOIN cardinalhealth_mdwdb.f_enhancement_rm TRGT 
ON (SRC.sys_id =TRGT.row_id     
AND SRC.sourceinstance= TRGT.source_id)
WHERE LKP.row_key <> TRGT.opened_c_key)temp;
