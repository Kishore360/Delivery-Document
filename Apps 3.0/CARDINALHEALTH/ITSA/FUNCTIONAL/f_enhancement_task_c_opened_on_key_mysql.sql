 SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.u_enhancement_task_final SRC
  JOIN cardinalhealth_mdwdb.f_enhancement_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN cardinalhealth_mdwdb.d_calendar_date LKP 
on (LKP.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(opened_at,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED'))
WHERE LKP.row_key <> TRGT.opened_on_key)temp;


